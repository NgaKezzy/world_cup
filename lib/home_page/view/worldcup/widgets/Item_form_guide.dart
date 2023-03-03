import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';

class ItemFormGuide extends StatelessWidget {
  const ItemFormGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.size50,
      width: AppSize.sizeWidthApp,
      child: Column(
        children: [
          Container(
            height: AppSize.size50 - 1,
            width: AppSize.sizeWidthApp,
            padding: const EdgeInsets.symmetric(horizontal: AppSize.size20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextCustom(text: '0-0 v CRY', color: AppColors.black),
                Container(
                  height: AppSize.size25,
                  width: AppSize.size25,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/chelsea.png'),
                          fit: BoxFit.cover)),
                ),
                const TextCustom(
                    text: 'H',
                    color: AppColors.black,
                    weight: FontFamily.semiBold),
                Container(
                  alignment: Alignment.center,
                  height: AppSize.size25,
                  width: AppSize.size25,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.black.withOpacity(0.8),
                  ),
                  child:
                      const TextCustom(text: 'D', weight: FontFamily.semiBold),
                ),
                const SizedBox(width: AppSize.size20),
                Container(
                  alignment: Alignment.center,
                  height: AppSize.size25,
                  width: AppSize.size25,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.red,
                  ),
                  child:
                      const TextCustom(text: 'D', weight: FontFamily.semiBold),
                ),
                const TextCustom(
                    text: 'H',
                    color: AppColors.black,
                    weight: FontFamily.semiBold),
                Container(
                  height: AppSize.size25,
                  width: AppSize.size25,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/chelsea.png'),
                          fit: BoxFit.cover)),
                ),
                const TextCustom(text: '0-0 v CRY', color: AppColors.black),
              ],
            ),
          ),
          Container(
            height: AppSize.size1,
            width: AppSize.sizeWidthApp,
            color: AppColors.grey_f2f,
          ),
        ],
      ),
    );
  }
}
