import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';

class ItemStackDetail extends StatelessWidget {
  ItemStackDetail({super.key, required this.cl, required this.name});
  Color cl;
  String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppSize.size10),
        InkWell(
          onTap: (() {}),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 90,
                width: AppSize.sizeWidthApp,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/ngoaihang.jpg'),
                        fit: BoxFit.cover)),
              ),
              Container(
                  height: 90,
                  width: AppSize.sizeWidthApp,
                  color: AppColors.black.withOpacity(0.6)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: AppSize.size10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        TextCustom(
                            text: name,
                            color: cl,
                            fontSize: AppSize.size20,
                            weight: FontFamily.semiBold),
                        TextCustom(
                          text: name,
                          fontSize: AppSize.size20,
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_right_alt,
                        color: AppColors.white, size: AppSize.size20),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          height: AppSize.size5,
          width: AppSize.sizeWidthApp,
          color: cl,
        )
      ],
    );
  }
}
