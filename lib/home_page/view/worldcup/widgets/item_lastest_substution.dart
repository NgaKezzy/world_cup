import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';

class ItemLastestSubtution extends StatelessWidget {
  const ItemLastestSubtution({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.grey,

      width: AppSize.sizeWidthApp,
      height: AppSize.size80,
      // padding: const EdgeInsets.symmetric(horizontal: AppSize.size20),
      child: Row(children: [
        Container(
          width: AppSize.sizeWidthApp * 0.23,
          height: AppSize.size80,
          // color: AppColors.grey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: AppSize.size35,
                  width: AppSize.size35,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.blue_2D1)),
              SizedBox(height: AppSize.size5),
              TextCustom(text: '90 +5\'', color: AppColors.black)
            ],
          ),
        ),
        Container(
          width: AppSize.sizeWidthApp * 0.77,
          height: AppSize.size80,
          color: AppColors.grey,
          child: Column(children: [
            Container(
              height: AppSize.size1,
              width: AppSize.sizeWidthApp * 0.77,
              // color: AppColors.grey,
            ),
            Container(
              alignment: Alignment.center,
              height: AppSize.size80 - 1,
              width: AppSize.sizeWidthApp * 0.77,
              padding: const EdgeInsets.symmetric(horizontal: AppSize.size10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  TextCustom(
                      text: 'Substitution',
                      color: AppColors.black,
                      weight: FontFamily.semiBold),
                  TextCustom(
                    text:
                        'By default, the linked page will e this, you must specify another target for the',
                    color: AppColors.black,
                  ),
                ],
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}
