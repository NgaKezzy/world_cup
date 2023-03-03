import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_size.dart';

class ItemLatestNoStartedYet extends StatelessWidget {
  const ItemLatestNoStartedYet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.sizeWidthApp,
      // height: AppSize.size80,
      // padding: const EdgeInsets.symmetric(horizontal: AppSize.size20),
      child: Row(children: [
        Container(
          width: AppSize.sizeWidthApp * 0.23,
          // height: AppSize.size80,
          // color: AppColors.green,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: AppSize.size35,
                  width: AppSize.size35,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.red)),
            ],
          ),
        ),
        Container(
          width: AppSize.sizeWidthApp * 0.77,
          // height: AppSize.size80,
          // color: AppColors.red,
          child: Column(children: [
            Container(
              height: AppSize.size1,
              width: double.infinity,
              color: AppColors.grey,
            ),
            Container(
              alignment: Alignment.center,
              height: AppSize.size80 - 1,
              width: AppSize.sizeWidthApp * 0.77,
              padding: const EdgeInsets.symmetric(horizontal: AppSize.size10),
              child: const TextCustom(
                text:
                    'By default, the linked ecifent  window. To change this, you must specify another target for the',
                color: AppColors.black,
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}
