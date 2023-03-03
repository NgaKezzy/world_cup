import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/config_app/app_api.dart';
import 'package:worldcup_app/models/firebase/highlight.dart';
import 'package:worldcup_app/models/firebase/section.dart';
import 'package:worldcup_app/services/storage/local_storage_service.dart';

class LatestVideoController extends GetxController {
  RxBool _isLoading = true.obs;
  bool get isLoading => _isLoading.value;

  List<HighLight> listVideos = [];

  final args = Get.arguments;

  final instanceFireStore = FirebaseFirestore.instance;
  final instanceFireStorage = FirebaseStorage.instance.ref();

  void getNews() async {
    final highlightCollection = instanceFireStore.collection(AppApi.highlight);
    late final listData;
    log(LocalStorageService().getString('shortName')!);
    listData = await highlightCollection
        .where('lang', isEqualTo: LocalStorageService().getString('shortName'))
        .get();

    for (var highLight in listData.docs) {
      var pathString =
          await instanceFireStorage.child(highLight['image']).getDownloadURL();
      var instanceNews = HighLight(
        description: highLight['description'],
        title: highLight['title'],
        videoId: highLight['videoId'],
        imageUrl: pathString,
        type: highLight['type'],
        section: [],
        team: '',
        created: highLight['created'],
      );
      listVideos.add(instanceNews);
    }
    _isLoading(false);
  }

  @override
  void onInit() {
    getNews();
    super.onInit();
  }
}
