import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';

class ItemManOfMatch extends StatelessWidget {
  const ItemManOfMatch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: AppSize.size60,
        width: AppSize.sizeWidthApp,
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppSize.size10),
                    width: AppSize.sizeWidthApp * 0.4 - 10,
                    child: Row(
                      children: const [
                        TextCustom(text: 'EVE', color: AppColors.black),
                        SizedBox(width: AppSize.size5),
                        TextCustom(
                            text: '1-1',
                            color: AppColors.black,
                            weight: FontFamily.semiBold),
                        SizedBox(width: AppSize.size5),
                        TextCustom(text: 'WHU', color: AppColors.black),
                      ],
                    ),
                  ),
                  Container(
                    width: AppSize.sizeWidthApp * 0.6 - 10,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: AppSize.sizeWidthApp * 0.15,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/player.png'),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(width: AppSize.size10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                TextCustom(
                                    text: 'Neal', color: AppColors.black),
                                TextCustom(
                                    text: 'Maupay',
                                    color: AppColors.black,
                                    fontSize: AppSize.size15,
                                    weight: FontFamily.semiBold),
                              ],
                            ),
                          ),
                          SvgPicture.asset('assets/svg/arrow_right.svg',
                              color: AppColors.grey)
                        ]),
                  )
                ],
              ),
            ),
            Container(
                height: AppSize.size1,
                width: AppSize.sizeWidthApp,
                color: AppColors.grey.withOpacity(0.3))
          ],
        ));
  }
}
