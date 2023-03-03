import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';

class BillboardsLatest extends StatelessWidget {
  const BillboardsLatest({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.size100 * 4.5,
      width: AppSize.sizeWidthApp,
      padding: const EdgeInsets.symmetric(
          horizontal: AppSize.size10, vertical: AppSize.size15),
      color: AppColors.black.withOpacity(0.1),
      child: Stack(alignment: Alignment.center, children: [
        Container(
            alignment: Alignment.center,
            height: AppSize.size100 * 4.5 - 20,
            width: AppSize.sizeWidthApp - 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.size5),
                gradient: LinearGradient(colors: [
                  AppColors.purple.withOpacity(0.9),
                  AppColors.pink.withOpacity(0.9)
                ]))),
        Container(
          height: AppSize.size100 * 4.5 - 20,
          width: AppSize.sizeWidthApp - 20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TextCustom(
                      text: 'Premier  ',
                      weight: FontFamily.semiBold,
                      fontSize: AppSize.size16),
                  Container(
                      height: AppSize.size25,
                      width: AppSize.size25,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('assets/images/chelsea.png'),
                      ))),
                  const TextCustom(
                      text: '  League',
                      weight: FontFamily.semiBold,
                      fontSize: AppSize.size16),
                ],
              ),
              const SizedBox(height: AppSize.size10),
              const TextCustom(text: 'KIERAN', fontSize: AppSize.size20),
              // const SizedBox(height: AppSize.size5),
              const TextCustom(
                  text: 'TRIPPIER',
                  fontSize: AppSize.size30,
                  weight: FontFamily.semiBold),
              Container(
                  height: AppSize.size150 * 0.9,
                  width: AppSize.sizeWidthApp * 0.35,
                  decoration: const BoxDecoration(
                      // color: AppColors.aqua,
                      image: DecorationImage(
                          image: AssetImage('assets/images/player.png'),
                          fit: BoxFit.cover))),
              Container(
                  height: AppSize.size2,
                  width: AppSize.sizeWidthApp * 0.6,
                  color: AppColors.white.withOpacity(0.3)),
              const SizedBox(height: AppSize.size10),
              const TextCustom(
                  text: 'MAN OF THE MATCH',
                  fontSize: AppSize.size20,
                  weight: FontFamily.semiBold),
              const SizedBox(height: AppSize.size10),
              Container(
                  height: AppSize.size2,
                  width: AppSize.sizeWidthApp * 0.6,
                  color: AppColors.white.withOpacity(0.3)),
              const SizedBox(height: AppSize.size20),
              Container(
                alignment: Alignment.center,
                height: AppSize.size50,
                width: AppSize.sizeWidthApp * 0.55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.white),
                child: const TextCustom(
                    text: 'View All Result',
                    color: AppColors.black,
                    fontSize: AppSize.size18),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
