import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';

class ItemClub extends StatelessWidget {
  const ItemClub({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: AppSize.size10),
      padding: EdgeInsets.all(10),
      height: AppSize.size80,
      width: AppSize.sizeWidthApp,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSize.size5)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        const TextCustom(
            text: 'Club Partner',
            color: AppColors.black,
            weight: FontFamily.semiBold),
        Container(
          height: AppSize.size25,
          width: AppSize.size30,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Adidas.jpg'),
            ),
          ),
        ),
      ]),
    );
  }
}
