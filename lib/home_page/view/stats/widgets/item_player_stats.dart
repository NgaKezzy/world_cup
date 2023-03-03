import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';

class ItemPlayerStats extends StatelessWidget {
  const ItemPlayerStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSize.size10),
      color: AppColors.white,
      child: Column(
        children: [
          Container(
            height: AppSize.size50,
            child: Column(
              children: [
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding:
                            const EdgeInsets.only(left: AppSize.size10),
                        height: AppSize.size50 - 1,
                        width: AppSize.sizeWidthApp * 0.1,
                        child: const TextCustom(
                            text: '11',
                            weight: FontFamily.semiBold,
                            color: AppColors.black),
                      ),
                      Container(
                          alignment: Alignment.centerLeft,
                          height: AppSize.size50 - 1,
                          width: AppSize.sizeWidthApp * 0.5 - 30,
                          child: const TextCustom(
                              text: 'Marcus Rashford',
                              weight: FontFamily.semiBold,
                              color: AppColors.black)),
                      Container(
                          alignment: Alignment.centerLeft,
                          height: AppSize.size50 - 1,
                          width: AppSize.sizeWidthApp * 0.2,
                          child: Row(
                            children: [
                              Container(
                                height: AppSize.size25,
                                width: AppSize.size25,
                                child: SvgPicture.asset('assets/svg/mu.svg',
                                    height: AppSize.size25),
                              ),
                              const SizedBox(width: AppSize.size10),
                              const TextCustom(
                                  text: 'MUN',
                                  weight: FontFamily.medium,
                                  color: AppColors.grey,
                                  fontSize: AppSize.size15),
                            ],
                          )),
                      Container(
                          padding:
                              const EdgeInsets.only(right: AppSize.size10),
                          height: AppSize.size50 - 1,
                          alignment: Alignment.centerRight,
                          width: AppSize.sizeWidthApp * 0.2,
                          child: const TextCustom(
                              text: '2',
                              weight: FontFamily.semiBold,
                              color: AppColors.black)),
                    ]),
                Container(
                  height: AppSize.size1,
                  color: AppColors.grey.withOpacity(0.3),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
