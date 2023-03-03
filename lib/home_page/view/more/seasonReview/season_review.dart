import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/widgets/widgets.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/home_page/view/more/seasonReview/more_video.dart';
import 'package:worldcup_app/home_page/view/more/seasonReview/timeline.dart';
import 'package:get/get.dart';

class SeasonReview extends StatelessWidget {
  const SeasonReview({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Column(
        children: [
          SafeArea(
              child: HeaderBase(
            text: 'SeasonReview'.tr,
          )),
          SizedBox(
            height: MediaQuery.of(context).size.height - 105,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/6.png',
                      ),
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppSize.size5),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        ButtonBase(
                          fillColor: AppColors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(AppSize.size5)),
                          child: Container(
                            height: 45,
                            width: AppSize.sizeWidthApp,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                          height: 45,
                                          width: 5,
                                          decoration: BoxDecoration(
                                              color: AppColors.pink,
                                              borderRadius:
                                                  BorderRadius.circular(5))),
                                      SizedBox(width: 10),
                                      TextCustom(
                                        text: 'Football'.tr,
                                        color: AppColors.black,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.arrow_forward,
                                      ),
                                      SizedBox(width: 10),
                                    ],
                                  )
                                ]),
                          ),
                        ),
                        ButtonBase(
                          fillColor: AppColors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(AppSize.size5)),
                          child: Container(
                            height: 45,
                            width: AppSize.sizeWidthApp,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                          height: 45,
                                          width: 5,
                                          decoration: BoxDecoration(
                                              color: AppColors.purple,
                                              borderRadius:
                                                  BorderRadius.circular(5))),
                                      SizedBox(width: 10),
                                      TextCustom(
                                        color: AppColors.black,
                                        text: 'NoRoomForRacism'.tr,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.arrow_forward,
                                      ),
                                      SizedBox(width: 10),
                                    ],
                                  )
                                ]),
                          ),
                        ),
                        ButtonBase(
                          fillColor: AppColors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(AppSize.size5)),
                          child: Container(
                            height: 45,
                            width: AppSize.sizeWidthApp,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                          height: 45,
                                          width: 5,
                                          decoration: BoxDecoration(
                                              color: AppColors.green,
                                              borderRadius:
                                                  BorderRadius.circular(5))),
                                      SizedBox(width: 10),
                                      TextCustom(
                                        color: AppColors.black,
                                        text: 'fans'.tr,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.arrow_forward,
                                      ),
                                      SizedBox(width: 10),
                                    ],
                                  )
                                ]),
                          ),
                        ),
                        ButtonBase(
                          fillColor: AppColors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(AppSize.size5)),
                          child: Container(
                            height: 45,
                            width: AppSize.sizeWidthApp,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                          height: 45,
                                          width: 5,
                                          decoration: BoxDecoration(
                                              color: AppColors.aqua,
                                              borderRadius:
                                                  BorderRadius.circular(5))),
                                      SizedBox(width: 10),
                                      TextCustom(
                                        color: AppColors.black,
                                        text: 'ForceforGood'.tr,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.arrow_forward,
                                      ),
                                      SizedBox(width: 10),
                                    ],
                                  )
                                ]),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                         TextCustom(
                            text: 'Videos'.tr,
                            fontSize: AppSize.size18,
                            color: AppColors.white,
                            weight: FontFamily.semiBold),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          color: AppColors.black,
                          child: TextCustom(text: 'Thêm các video vào'),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => MoreVideo());
                          },
                          child: ButtonBase(
                            fillColor: AppColors.pink,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(AppSize.size5)),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppSize.size10),
                              height: 45,
                              width: AppSize.sizeWidthApp,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children:  [
                                    const SizedBox(),
                                    TextCustom(
                                      text: 'MoreVideos'.tr,
                                      fontSize: AppSize.size16,
                                    ),
                                    const Icon(
                                      Icons.arrow_forward,
                                      color: AppColors.white,
                                    )
                                  ]),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => Timeline());
                          },
                          child: ButtonBase(
                            fillColor: AppColors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(AppSize.size5)),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppSize.size10),
                              height: 45,
                              width: AppSize.sizeWidthApp,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children:  [
                                        const Icon(Icons.drag_indicator,
                                            color: Colors.black),
                                            SizedBox(width: 15),
                                        TextCustom(
                                            text: 'Timeline'.tr,
                                            fontSize: AppSize.size16,
                                            color: AppColors.black),
                                      ],
                                    ),
                                    const Icon(
                                      Icons.arrow_forward,
                                      color: AppColors.grey,
                                      size: 20,
                                    )
                                  ]),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const TextCustom(
                                      text: 'PDF DOWNLOAD',
                                      fontSize: AppSize.size18),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const TextCustom(
                                    text:
                                        'Season Review publication 2020/21 (6.18MB)',
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                      height: 250,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/man-city-vo-dich-ngoai-hang-anh-202122-085007630.jpg'),
                                              fit: BoxFit.cover))),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                    height: 3,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: const BoxDecoration(
                                        gradient: LinearGradient(colors: [
                                      AppColors.white,
                                      AppColors.red_631
                                    ])),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                            'assets/icons/200-download3.svg',
                                            color: AppColors.white),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          child: const TextCustom(
                                            text: ' Download the report',
                                            fontSize: AppSize.size14,
                                          ),
                                        )
                                      ])
                                ],
                              ),
                            ),
                            const SizedBox(width: AppSize.size20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const TextCustom(
                                      text: 'PDF DOWNLOAD',
                                      fontSize: AppSize.size18),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const TextCustom(
                                    text:
                                        'Primier League Season Review 2020/21 publication (0.2MB)',
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                    height: 250,
                                    width: MediaQuery.of(context).size.width,
                                    color: AppColors.red_99,
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Container(
                                                height: 30,
                                                width: 100,
                                                child: const Image(
                                                    image: AssetImage(
                                                        'assets/images/1200px-Premier_League_Logo.svg.png')),
                                              )
                                            ],
                                          ),
                                          Container(
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            child: Column(children: const [
                                              TextCustom(
                                                  text: 'Season Review',
                                                  fontSize: AppSize.size18),
                                              TextCustom(
                                                  text: '2020/21',
                                                  fontSize: AppSize.size13)
                                            ]),
                                          )
                                        ]),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                    height: 3,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: const BoxDecoration(
                                        gradient: LinearGradient(colors: [
                                      AppColors.white,
                                      AppColors.red_631
                                    ])),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                            'assets/icons/200-download3.svg',
                                            color: AppColors.white),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          child: const TextCustom(
                                            text:
                                                ' Download accessible PDF report (0.2MB)',
                                            fontSize: AppSize.size14,
                                            weight: FontFamily.semiBold,
                                          ),
                                        )
                                      ])
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                      ]),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
