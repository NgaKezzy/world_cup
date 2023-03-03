import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:worldcup_app/common/widgets/widgets.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/home_page/view/worldcup/widgets/item_manager_pink.dart';
import 'package:worldcup_app/home_page/view/worldcup/widgets/item_manager_white.dart';

class Manager extends StatelessWidget {
  const Manager({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: SafeArea(
        child: Column(
          children: [
            const HeaderBase(text: 'Managers'),
            Container(
              height: AppSize.sizeHeightApp - 95,
              width: AppSize.sizeWidthApp,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: AppSize.size100 * 1.5,
                      width: AppSize.sizeWidthApp,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TextCustom(
                              text: 'Managers',
                              fontSize: AppSize.size30,
                              weight: FontFamily.semiBold),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: AppColors.black,
                                    borderRadius:
                                        BorderRadius.circular(AppSize.size5)),
                                height: AppSize.size50,
                                width: AppSize.sizeWidthApp - 20,
                                child: const TextField(
                                  style: TextStyle(color: AppColors.white),
                                  decoration: InputDecoration(
                                    hintText: 'Search',
                                    hintStyle:
                                        TextStyle(color: AppColors.white),
                                    hoverColor: AppColors.pink,
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: AppSize.sizeWidthApp,
                      color: AppColors.white,
                      padding: const EdgeInsets.all(10),
                      child: Column(children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: AppSize.size10),
                              alignment: Alignment.centerLeft,
                              height: AppSize.size25,
                              width: AppSize.sizeWidthApp * 0.5 - 10,
                              color: AppColors.grey.withOpacity(0.2),
                              child: TextCustom(
                                  text: 'Manager', color: AppColors.black),
                            )
                          ],
                        ),
                        Column(
                          children: const [
                            ItemManagerPink(),
                            ItemManagerWhite(),
                            ItemManagerWhite(),
                            ItemManagerPink(),
                            ItemManagerPink(),
                            ItemManagerPink(),
                            ItemManagerPink(),
                            ItemManagerPink(),
                            ItemManagerPink(),
                            ItemManagerPink(),
                            ItemManagerWhite(),
                            ItemManagerPink(),
                            ItemManagerPink(),
                            ItemManagerPink(),
                            ItemManagerPink(),
                          ],
                        )
                      ]),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
