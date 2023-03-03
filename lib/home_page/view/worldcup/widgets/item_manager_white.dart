import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';

class ItemManagerWhite extends StatelessWidget {
  const ItemManagerWhite({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.size45,
      width: AppSize.sizeWidthApp,
      // color: AppColors.green,
      child: Column(
        children: [
          Expanded(
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                height: AppSize.size45 - 4,
                width: AppSize.size5,
                color: AppColors.white,
              ),
              Container(
                padding: EdgeInsets.only(left: AppSize.size5),
                alignment: Alignment.centerLeft,
                height: AppSize.size45 - 1,
                width: AppSize.sizeWidthApp * 0.5 - 13,
                child: const TextCustom(
                    text: 'Gary O\'Neil',
                    color: AppColors.black,
                    fontSize: AppSize.size15),
              ),
              Container(
                padding: EdgeInsets.only(left: AppSize.size5),
                alignment: Alignment.centerLeft,
                height: AppSize.size45 - 1,
                width: AppSize.sizeWidthApp * 0.5 - 13,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  SvgPicture.asset('assets/svg/mu.svg', height: 20),
                  SizedBox(width: AppSize.size10),
                  const TextCustom(
                      text: 'Manchester united',
                      fontSize: AppSize.size10,
                      color: AppColors.black,
                      weight: FontFamily.semiBold),
                ]),
              ),
            ]),
          ),
          Container(
              height: AppSize.size1,
              width: AppSize.sizeWidthApp,
              color: AppColors.grey.withOpacity(0.3))
        ],
      ),
    );
  }
}
