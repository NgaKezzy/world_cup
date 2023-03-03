import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';

class ItemShirtPlayer extends StatelessWidget {
  const ItemShirtPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: AppSize.size10),
      height: AppSize.size100 * 3,
      width: AppSize.sizeWidthApp,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow:
            kElevationToShadow[2], // Use This kElevationToShadow ***********
      ),
      child: Column(
        children: [
         
          Container(
            height: AppSize.size100 * 3 - 10,
            width: AppSize.sizeWidthApp,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const TextCustom(
                    text: 'Newcastle Home Kit',
                    color: AppColors.black,
                    fontSize: AppSize.size16,
                    weight: FontFamily.medium),
                Container(
                  height: AppSize.size100 * 1.5,
                  width: AppSize.size100 * 1.2,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/player.png'),
                          fit: BoxFit.cover)),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      TextCustom(
                          text: 'Buy Now',
                          color: AppColors.black,
                          fontSize: AppSize.size16,
                          weight: FontFamily.medium),
                      SizedBox(width: AppSize.size10),
                      Icon(Icons.arrow_right_alt,
                          size: 20, color: AppColors.grey)
                    ])
              ],
            ),
          ),
        ],
      ),
    );
  }
}
