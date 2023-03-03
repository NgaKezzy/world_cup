import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/widgets/widgets.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/home_page/view/more/widgets/item_timeline.dart';

class Timeline extends StatelessWidget {
  const Timeline({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Column(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            height: 90,
            padding: const EdgeInsets.symmetric(horizontal: AppSize.size10),
            child: Row(
              children: [
                // const SizedBox(
                //   height: 70,
                // ),
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: AppColors.white,
                    )),
                 TextCustom(
                    text: 'SeasonReview'.tr, fontSize: AppSize.size18),
                const Expanded(
                  child: SizedBox(),
                ),
                const Icon(Icons.share, color: AppColors.white)
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 90,
            padding: EdgeInsets.symmetric(horizontal: AppSize.size10),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      TextCustom(
                          text: 'Primier League',
                          fontSize: AppSize.size30,
                          weight: FontFamily.medium),
                    ],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        TextCustom(
                            text: 'SEASON TIMELINE 2020/21',
                            fontSize: AppSize.size16,
                            color: AppColors.aqua)
                      ]),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 3,
                        width: MediaQuery.of(context).size.width * 0.6,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [AppColors.red_631, Colors.purple])),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 12.5),
                          Column(
                            children: [
                              Container(
                                  height: 20,
                                  width: 20,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                      color: AppColors.pink,
                                      shape: BoxShape.circle),
                                  child: Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                          color: Colors.purple.shade900,
                                          shape: BoxShape.circle))),
                              Container(
                                height: 80,
                                width: 5,
                                color: AppColors.pink,
                              )
                            ],
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          const TextCustom(
                            text: 'September',
                            fontSize: AppSize.size30,
                            color: AppColors.white,
                          ),
                        ]),
                  ),
                  ItemTimeline(),
                  ItemTimeline(),
                  ItemTimeline(),
                  ItemTimeline(),
                  ItemTimeline(),
                  ItemTimeline(),
                  ItemTimeline(),
                  ItemTimeline(),
                  ItemTimeline(),
                  ItemTimeline(),
                  ItemTimeline(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
