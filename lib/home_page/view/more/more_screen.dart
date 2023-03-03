import 'dart:developer';
import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:worldcup_app/common/constant/package_iap.dart';
import 'package:worldcup_app/common/controller/main_controller.dart';
import 'package:worldcup_app/common/widgets/widgets.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_routes.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/home_page/view/more/notifications.dart';
import 'package:worldcup_app/home_page/view/more/seasonReview/season_review.dart';
import 'package:worldcup_app/home_page/view/more/seasonReview/tab_seassion_review.dart';
import 'package:worldcup_app/home_page/view/more/widgets/show_dialog_more.dart';
import 'package:worldcup_app/legal/view/legal_screen.dart';
import 'package:worldcup_app/services/storage/local_storage_service.dart';
import 'package:worldcup_app/store/view/store_sale_screen.dart';
import 'package:worldcup_app/webview/view/web_view_screen.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> with WidgetsBindingObserver {
  late bool _isSetting = false;
  @override
  void initState() {
    super.initState();
    _isSetting = LocalStorageService().getBool('notification_on') ?? false;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    print(state);
    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission(
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
      setState(() {
        _isSetting = true;
      });
    } else {
      LocalStorageService().setBool('notification_on', false);
      setState(() {
        _isSetting = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final MainController mainController = Get.find();
    return BaseScreen(
      // withScaffold: false,
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: AppSize.size15),
            Row(
              children: [
                const SizedBox(width: AppSize.size10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextCustom(
                    text: 'Settings'.tr,
                    fontSize: AppSize.size20,
                    weight: FontFamily.medium,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: AppSize.size20,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Container(
                  color: AppColors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Container(
                      //   width: double.infinity,
                      //   color: AppColors.grey_f2f,
                      //   padding: const EdgeInsets.symmetric(
                      //     horizontal: AppSize.size10,
                      //     vertical: AppSize.size10,
                      //   ),
                      //   child: TextCustom(
                      //     text: 'Donate',
                      //     fontStyle: FontFamily.italic,
                      //     color: AppColors.black,
                      //     weight: FontFamily.medium,
                      //   ),
                      // ),
                      // ButtonBase(
                      //   onPressed: () {
                      //     if (mainController.products.isNotEmpty) {
                      //       mainController.products.forEach((element) {
                      //         if (element.id == buycafe) {
                      //           mainController.subscribe(product: element);
                      //         }
                      //       });
                      //     }
                      //   },
                      //   fillColor: AppColors.white,
                      //   shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(AppSize.size5)),
                      //   child: Container(
                      //     padding: const EdgeInsets.symmetric(
                      //       horizontal: AppSize.size10,
                      //       vertical: AppSize.size20,
                      //     ),
                      //     width: AppSize.sizeWidthApp,
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         Row(
                      //           children: [
                      //             SvgPicture.asset(
                      //               'assets/svg/like.svg',
                      //               height: AppSize.size18,
                      //             ),
                      //             const SizedBox(width: AppSize.size5),
                      //             TextCustom(
                      //               text: 'Give me a coffee',
                      //               color: AppColors.black,
                      //             ),
                      //           ],
                      //         ),
                      //         Row(
                      //           children: [
                      //             SvgPicture.asset(
                      //               'assets/svg/arrow_right.svg',
                      //               height: AppSize.size18,
                      //             ),
                      //             SizedBox(width: AppSize.size10),
                      //           ],
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // ButtonBase(
                      //   onPressed: () {
                      //     if (mainController.products.isNotEmpty) {
                      //       mainController.products.forEach((element) {
                      //         if (element.id == thankyou) {
                      //           mainController.subscribe(product: element);
                      //         }
                      //       });
                      //     }
                      //   },
                      //   fillColor: AppColors.white,
                      //   shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(AppSize.size5)),
                      //   child: Container(
                      //     padding: const EdgeInsets.symmetric(
                      //       horizontal: AppSize.size10,
                      //       vertical: AppSize.size20,
                      //     ),
                      //     width: AppSize.sizeWidthApp,
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         Row(
                      //           children: [
                      //             SvgPicture.asset(
                      //               'assets/svg/heart.svg',
                      //               height: AppSize.size18,
                      //             ),
                      //             const SizedBox(width: AppSize.size5),
                      //             TextCustom(
                      //               text: 'Say thank you',
                      //               color: AppColors.black,
                      //             ),
                      //           ],
                      //         ),
                      //         Row(
                      //           children: [
                      //             SvgPicture.asset(
                      //               'assets/svg/arrow_right.svg',
                      //               height: AppSize.size18,
                      //             ),
                      //             SizedBox(width: AppSize.size10),
                      //           ],
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // if (LocalStorageService().getBool('noPremium') ?? true)
                      //   ButtonBase(
                      //     onPressed: () {
                      //       if (mainController.products.isNotEmpty) {
                      //         mainController.products.forEach((element) {
                      //           if (element.id == getPremium) {
                      //             mainController.subscribe(product: element);
                      //           }
                      //         });
                      //       }
                      //     },
                      //     fillColor: AppColors.white,
                      //     shape: RoundedRectangleBorder(
                      //         borderRadius:
                      //             BorderRadius.circular(AppSize.size5)),
                      //     child: Container(
                      //       padding: const EdgeInsets.symmetric(
                      //         horizontal: AppSize.size10,
                      //         vertical: AppSize.size20,
                      //       ),
                      //       width: AppSize.sizeWidthApp,
                      //       child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           Row(
                      //             children: [
                      //               SvgPicture.asset(
                      //                 'assets/svg/premium.svg',
                      //                 height: AppSize.size18,
                      //               ),
                      //               const SizedBox(width: AppSize.size5),
                      //               TextCustom(
                      //                 text: 'Become Premium',
                      //                 color: AppColors.black,
                      //               ),
                      //             ],
                      //           ),
                      //           Row(
                      //             children: [
                      //               SvgPicture.asset(
                      //                 'assets/svg/arrow_right.svg',
                      //                 height: AppSize.size18,
                      //               ),
                      //               SizedBox(width: AppSize.size10),
                      //             ],
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      Container(
                        width: double.infinity,
                        color: AppColors.grey_f2f,
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSize.size10,
                          vertical: AppSize.size10,
                        ),
                        child: TextCustom(
                          text: 'Notifications',
                          fontStyle: FontFamily.italic,
                          color: AppColors.black,
                          weight: FontFamily.medium,
                        ),
                      ),
                      ButtonBase(
                        onPressed: () async {
                          await AppSettings.openNotificationSettings();
                        },
                        fillColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppSize.size5)),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSize.size10,
                            vertical: AppSize.size10,
                          ),
                          width: AppSize.sizeWidthApp,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/svg/bell.svg',
                                    height: AppSize.size18,
                                  ),
                                  const SizedBox(width: AppSize.size5),
                                  TextCustom(
                                    text: 'Notification on',
                                    color: AppColors.black,
                                  ),
                                ],
                              ),
                              // Switch.adaptive(
                              //   value: _isSetting,
                              //   onChanged: (newValue) async {},
                              // )
                            ],
                          ),
                        ),
                      ),
                      ButtonBase(
                        onPressed: () => Get.toNamed(AppRoutes.chooseFavTeam),
                        fillColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppSize.size5)),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSize.size10,
                            vertical: AppSize.size20,
                          ),
                          width: AppSize.sizeWidthApp,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/svg/shield.svg',
                                    height: AppSize.size18,
                                  ),
                                  const SizedBox(width: AppSize.size5),
                                  TextCustom(
                                    text: 'Team'.tr,
                                    color: AppColors.black,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/svg/arrow_right.svg',
                                    height: AppSize.size18,
                                  ),
                                  SizedBox(width: AppSize.size10),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      ButtonBase(
                        onPressed: () => Get.toNamed(AppRoutes.chooseLanguage),
                        fillColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppSize.size5)),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSize.size10,
                            vertical: AppSize.size20,
                          ),
                          width: AppSize.sizeWidthApp,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/svg/lang.svg',
                                    height: AppSize.size18,
                                  ),
                                  const SizedBox(width: AppSize.size5),
                                  TextCustom(
                                    text: 'Language'.tr,
                                    color: AppColors.black,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/svg/arrow_right.svg',
                                    height: AppSize.size18,
                                  ),
                                  SizedBox(width: AppSize.size10),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      ButtonBase(
                        onPressed: () => Get.toNamed(AppRoutes.storeSale),
                        fillColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppSize.size5)),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSize.size10,
                            vertical: AppSize.size20,
                          ),
                          width: AppSize.sizeWidthApp,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/svg/store.svg',
                                    height: AppSize.size18,
                                  ),
                                  const SizedBox(width: AppSize.size5),
                                  TextCustom(
                                    text: 'Store'.tr,
                                    color: AppColors.black,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/svg/arrow_right.svg',
                                    height: AppSize.size18,
                                  ),
                                  SizedBox(width: AppSize.size10),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        color: AppColors.grey_f2f,
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSize.size10,
                          vertical: AppSize.size10,
                        ),
                        child: TextCustom(
                          text: 'Help',
                          fontStyle: FontFamily.italic,
                          color: AppColors.black,
                          weight: FontFamily.medium,
                        ),
                      ),
                      ButtonBase(
                        fillColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppSize.size5)),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSize.size10,
                            vertical: AppSize.size20,
                          ),
                          width: AppSize.sizeWidthApp,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/svg/comment.svg',
                                    height: AppSize.size18,
                                  ),
                                  const SizedBox(width: AppSize.size5),
                                  TextCustom(
                                    text: 'Support'.tr,
                                    color: AppColors.black,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/svg/arrow_right.svg',
                                    height: AppSize.size18,
                                  ),
                                  SizedBox(width: AppSize.size10),
                                ],
                              ),
                            ],
                          ),
                        ),
                        onPressed: () => Get.to(
                          () => WebViewScreen(
                              header: 'Support',
                              url: 'https://rebrand.ly/wccontact'),
                        ),
                      ),
                      Divider(
                        height: AppSize.size0,
                      ),
                      ButtonBase(
                        fillColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppSize.size5)),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSize.size10,
                            vertical: AppSize.size20,
                          ),
                          width: AppSize.sizeWidthApp,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/svg/faq.svg',
                                    height: AppSize.size18,
                                    color: AppColors.black,
                                  ),
                                  const SizedBox(width: AppSize.size5),
                                  TextCustom(
                                    text: 'FAQ',
                                    color: AppColors.black,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/svg/arrow_right.svg',
                                    height: AppSize.size18,
                                  ),
                                  SizedBox(width: AppSize.size10),
                                ],
                              ),
                            ],
                          ),
                        ),
                        onPressed: () => Get.to(
                          () => WebViewScreen(
                            header: 'FAQ',
                            url: 'https://rebrand.ly/wcfaq',
                          ),
                        ),
                      ),
                      Divider(
                        height: AppSize.size0,
                      ),
                      ButtonBase(
                        fillColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppSize.size5)),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSize.size10,
                            vertical: AppSize.size20,
                          ),
                          width: AppSize.sizeWidthApp,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/svg/Instagram.svg',
                                    height: AppSize.size18,
                                  ),
                                  const SizedBox(width: AppSize.size5),
                                  TextCustom(
                                    text: 'Instagram',
                                    color: AppColors.black,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/svg/arrow_right.svg',
                                    height: AppSize.size18,
                                  ),
                                  SizedBox(width: AppSize.size10),
                                ],
                              ),
                            ],
                          ),
                        ),
                        onPressed: () => launchUrlString(
                          'https://rebrand.ly/wc2022ig',
                          mode: Platform.isAndroid
                              ? LaunchMode.externalNonBrowserApplication
                              : LaunchMode.platformDefault,
                        ),
                      ),
                      Divider(
                        height: AppSize.size0,
                      ),
                      ButtonBase(
                        fillColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppSize.size5)),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSize.size10,
                            vertical: AppSize.size20,
                          ),
                          width: AppSize.sizeWidthApp,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/svg/fb.svg',
                                    height: AppSize.size18,
                                  ),
                                  const SizedBox(width: AppSize.size5),
                                  TextCustom(
                                    text: 'Facebook',
                                    color: AppColors.black,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/svg/arrow_right.svg',
                                    height: AppSize.size18,
                                  ),
                                  SizedBox(width: AppSize.size10),
                                ],
                              ),
                            ],
                          ),
                        ),
                        onPressed: () => launchUrlString(
                          'https://rebrand.ly/wc2022fb',
                          mode: Platform.isAndroid
                              ? LaunchMode.externalNonBrowserApplication
                              : LaunchMode.platformDefault,
                        ),
                      ),
                      Divider(
                        height: AppSize.size0,
                      ),
                      ButtonBase(
                        fillColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppSize.size5)),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSize.size10,
                            vertical: AppSize.size20,
                          ),
                          width: AppSize.sizeWidthApp,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/svg/twitter.svg',
                                    height: AppSize.size18,
                                  ),
                                  const SizedBox(width: AppSize.size5),
                                  TextCustom(
                                    text: 'Twitter',
                                    color: AppColors.black,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/svg/arrow_right.svg',
                                    height: AppSize.size18,
                                  ),
                                  SizedBox(width: AppSize.size10),
                                ],
                              ),
                            ],
                          ),
                        ),
                        onPressed: () => launchUrlString(
                          'https://rebrand.ly/wc2022tw',
                          mode: Platform.isAndroid
                              ? LaunchMode.externalNonBrowserApplication
                              : LaunchMode.platformDefault,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        color: AppColors.grey_f2f,
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSize.size10,
                          vertical: AppSize.size10,
                        ),
                        child: TextCustom(
                          text: 'More'.tr,
                          fontStyle: FontFamily.italic,
                          color: AppColors.black,
                          weight: FontFamily.medium,
                        ),
                      ),
                      ButtonBase(
                        onPressed: () => showRateApp(),
                        fillColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppSize.size5)),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSize.size10,
                            vertical: AppSize.size20,
                          ),
                          width: AppSize.sizeWidthApp,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/svg/star.svg',
                                    height: AppSize.size18,
                                  ),
                                  const SizedBox(width: AppSize.size5),
                                  TextCustom(
                                    text: 'Rateapp'.tr,
                                    color: AppColors.black,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/svg/arrow_right.svg',
                                    height: AppSize.size18,
                                  ),
                                  SizedBox(width: AppSize.size10),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        color: AppColors.grey_f2f,
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSize.size10,
                          vertical: AppSize.size10,
                        ),
                        child: TextCustom(
                          text: 'Legal'.tr,
                          fontStyle: FontFamily.italic,
                          color: AppColors.black,
                          weight: FontFamily.medium,
                        ),
                      ),
                      ButtonBase(
                        fillColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppSize.size5)),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSize.size10,
                            vertical: AppSize.size20,
                          ),
                          width: AppSize.sizeWidthApp,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/svg/link.svg',
                                    height: AppSize.size18,
                                  ),
                                  const SizedBox(width: AppSize.size5),
                                  TextCustom(
                                    text: 'Legal'.tr,
                                    color: AppColors.black,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/svg/arrow_right.svg',
                                    height: AppSize.size18,
                                  ),
                                  SizedBox(width: AppSize.size10),
                                ],
                              ),
                            ],
                          ),
                        ),
                        onPressed: () => Get.to(
                          () => WebViewScreen(
                            header: 'Legal',
                            url: 'https://www.goonergame.com/legal',
                          ),
                        ),
                      ),
                      Divider(
                        height: AppSize.size0,
                      ),
                      ButtonBase(
                        fillColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppSize.size5)),
                        onPressed: () => Get.to(
                          () => WebViewScreen(
                              header: 'Privacy policy',
                              url: 'https://rebrand.ly/wcprivacy'),
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSize.size10,
                            vertical: AppSize.size20,
                          ),
                          width: AppSize.sizeWidthApp,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/svg/lock.svg',
                                    height: AppSize.size18,
                                  ),
                                  const SizedBox(width: AppSize.size5),
                                  TextCustom(
                                    text: 'PrivacyPolicy'.tr,
                                    color: AppColors.black,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/svg/arrow_right.svg',
                                    height: AppSize.size18,
                                  ),
                                  SizedBox(width: AppSize.size10),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      ButtonBase(
                        fillColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppSize.size5)),
                        onPressed: () => Get.to(
                          () => WebViewScreen(
                              header: 'Terms & Conditions',
                              url: 'https://goonergame.com/terms-1'),
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSize.size10,
                            vertical: AppSize.size20,
                          ),
                          width: AppSize.sizeWidthApp,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/svg/lock.svg',
                                    height: AppSize.size18,
                                  ),
                                  const SizedBox(width: AppSize.size5),
                                  TextCustom(
                                    text: 'Terms & Conditions',
                                    color: AppColors.black,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/svg/arrow_right.svg',
                                    height: AppSize.size18,
                                  ),
                                  SizedBox(width: AppSize.size10),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 150,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showRateApp() async {
    final InAppReview inAppReview = InAppReview.instance;
    inAppReview.openStoreListing(
      appStoreId: '6443799499',
    );
  }
}
