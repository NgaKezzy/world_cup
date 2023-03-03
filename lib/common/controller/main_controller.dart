import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as ta;
import 'package:worldcup_app/common/constant/package_iap.dart';
import 'package:worldcup_app/config_app/app_routes.dart';
import 'package:worldcup_app/main.dart' as main;
import 'package:worldcup_app/services/storage/local_storage_service.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (message.data['open'] == 'store') {
    Future.delayed(
      const Duration(seconds: 3),
      () async => Navigator.pushNamed(
          main.navigator.currentState!.context, AppRoutes.storeSale),
    );
    // Get.toNamed(AppRoutes.storeSale);
  }
}

class MainController extends GetxController {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  //Khai báo instance của local notifications
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  //Khai báo behavior để xử lý sự kiện
  final onNotification = BehaviorSubject<String?>();
  //Tạo ra 1 kênh thông báo local
  static final AndroidNotificationChannel _channel =
      const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications',
    importance: Importance.max,
  );

  List<String> _consumables = <String>[thankyou, buycafe, getPremium];
  String? _queryProductError;
  RxBool _isAvailable = false.obs;
  bool get isAvailable => _isAvailable.value;
  RxBool _purchasePending = false.obs;
  bool get purchasePending => _purchasePending.value;
  RxBool _isLoading = true.obs;
  bool get isLoading => _isLoading.value;

  // Lắng nghe sự kiện khi app được mở bằng 1 thông báo
  Future<void> setupInteractedMessage() async {
    RemoteMessage? initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  // Hàm xử lý thông báo khi app được mở
  void _handleMessage(RemoteMessage message) {
    if (message.data['open'] == 'store') {
      Future.delayed(
        const Duration(seconds: 3),
        () async => Navigator.pushNamed(
            main.navigator.currentState!.context, AppRoutes.storeSale),
      );

      // Get.toNamed(AppRoutes.storeSale);
    }
    log('Đây là thông báo: ${message.notification!.title}');
  }

  //Tạo kênh thông báo
  Future createChannelNotification() async {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .createNotificationChannel(_channel);
  }

  // Hàm khởi tạo thiết lập thông báo
  Future initLocalNotification() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iOS = IOSInitializationSettings();
    const setting = InitializationSettings(android: android, iOS: iOS);
    await flutterLocalNotificationsPlugin.initialize(
      setting,
      onSelectNotification: (payload) {
        onNotification.add(payload);
      },
    );
  }

  //Xứ lý việc lăng nghe vừa xử lý thoonng báo được nhấn vào trên nền
  void listenNotification() =>
      onNotification.stream.listen(onClickedNotification);
  void onClickedNotification(String? payload) async {
    if (payload == 'store') {
      Future.delayed(
        const Duration(seconds: 3),
        () async => Navigator.pushNamed(
            main.navigator.currentState!.context, AppRoutes.storeSale),
      );
      // Get.toNamed(AppRoutes.storeSale);
    }
    log('Đây là dữ liệu nè $payload');
  }

  void initial() async {
    Future.delayed(
        Duration(seconds: 2),
        () async =>
            await AppTrackingTransparency.requestTrackingAuthorization());
    setupInteractedMessage();
    await initLocalNotification();
    String? token = await _messaging.getToken();
    print('Đây là token: ' + '${token ?? ''}');
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    log('Cho phép quyền thông báo: ${settings.authorizationStatus}');
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      LocalStorageService().setBool('notification_on', true);
    } else {
      LocalStorageService().setBool('notification_on', false);
    }

    await createChannelNotification();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification!.android;

      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                _channel.id,
                _channel.name,
                channelDescription: _channel.description,
                icon: android.smallIcon,
              ),
            ),
            payload: message.data['open']);
      }
    });

    listenNotification();
  }

  static void showScheduleNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
    required DateTime scheduledDate,
  }) async {
    flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduledDate, tz.local),
      NotificationDetails(
        android: AndroidNotificationDetails(
          _channel.id,
          _channel.name,
          channelDescription: _channel.description,
        ),
      ),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
    );
  }

  @override
  void onInit() {
    initial();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    ta.initializeTimeZones();
    Jiffy.locale(LocalStorageService().getString('shortName'));
    super.onInit();
  }
}
