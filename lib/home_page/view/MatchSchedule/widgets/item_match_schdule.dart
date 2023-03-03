import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_size.dart';

class ItemMatchSchdule extends StatelessWidget {
  const ItemMatchSchdule({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.all(10),
        width: AppSize.sizeWidthApp,
        height: AppSize.size70,
        decoration: BoxDecoration(
            color: AppColors.grey,
            borderRadius: BorderRadius.circular(AppSize.size5)),
        child: Row(
          children: [
            Column(children: const [TextCustom(text: '01:45')]),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                    alignment: Alignment.center,
                    width: AppSize.sizeWidthApp * 0.2,
                    child: const TextCustom(text: 'Rossia'))
              ],
            ),
            Column(
              children: [
                Container(
                  width: AppSize.sizeWidthApp * 0.3 + 2,
                  child: Row(children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: AppSize.size5),
                      height: AppSize.size25,
                      width: AppSize.size25,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/chelsea.png'),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: AppSize.size25,
                      width: AppSize.size40,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(AppSize.size5)),
                      child: TextCustom(text: '-'),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: AppSize.size5),
                      height: AppSize.size25,
                      width: AppSize.size25,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/chelsea.png'),
                              fit: BoxFit.cover)),
                    ),
                  ]),
                ),
                Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: AppSize.size5),
                    height: AppSize.size18,
                    width: AppSize.sizeWidthApp * 0.3,
                    decoration: BoxDecoration(
                        color: AppColors.black.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(AppSize.size5)),
                    child: TextCustom(
                      text: 'Chưa diễn ra',
                    ))
              ],
            ),
            Column(
              children: [
                Container(
                    alignment: Alignment.center,
                    width: AppSize.sizeWidthApp * 0.2,
                    child: TextCustom(
                      text: 'Rossia',
                    ))
              ],
            ),
            Column(),
          ],
        ));
  }
}
