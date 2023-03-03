import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/home_page/view/more/widgets/item_fans.dart';
import 'package:worldcup_app/home_page/view/more/widgets/item_stack_detail.dart';

class EventFans extends StatelessWidget {
  const EventFans({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: AppSize.size100 * 5,
              width: AppSize.sizeWidthApp,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/ronie.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
            Positioned(
              top: AppSize.size100 * 2,
              child: Container(
                height: AppSize.size100 * 3,
                width: AppSize.sizeWidthApp,
                padding: const EdgeInsets.symmetric(horizontal: AppSize.size20),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: AppSize.sizeWidthApp * 0.6,
                      height: AppSize.size35,
                      color: AppColors.green,
                      child: TextCustom(
                          text: 'TheFans'.tr,
                          fontSize: AppSize.size16,
                          weight: FontFamily.semiBold),
                    ),
                    const SizedBox(
                      height: AppSize.size10,
                    ),
                    TextCustom(
                      text: 'TheFans'.tr,
                      fontSize: AppSize.size25,
                      weight: FontFamily.semiBold,
                    ),
                    const SizedBox(
                      height: AppSize.size10,
                    ),
                    const TextCustom(
                      text:
                          '"Overall, we\'ve been ahead of schedule in our recruitment plans. We\'ve made a significant investment in the first team with the addition of five players. This group has a balance of experienced international players. experience and emerging young talent," emphasized Murtough.',
                    ),
                    const SizedBox(
                      height: AppSize.size10,
                    ),
                    const TextCustom(
                      text: 'Pep Guardiola, Manager, Manchester City',
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
          width: AppSize.sizeWidthApp,
          padding: const EdgeInsets.symmetric(horizontal: AppSize.size20),
          child: Column(
            children: const [
              ItemFans(),
              ItemFans(),
              ItemFans(),
              ItemFans(),
              ItemFans(),
              ItemFans(),
              ItemFans(),
              ItemFans(),
              ItemFans(),
              ItemFans(),
              ItemFans(),
            ],
          ),
        ),
        const SizedBox(height: AppSize.size10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.size10),
          child: Column(children: [
            ItemStackDetail(cl: AppColors.pink, name: "TheFoodball".tr),
            ItemStackDetail(
                cl: AppColors.purple, name: "TheNoRoomForRacism".tr),
            ItemStackDetail(cl: AppColors.aqua, name: 'ForceforGood'.tr),
          ]),
        ),
        const SizedBox(height: AppSize.size20),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.size10),
          child: Row(children: [
            Container(
              height: AppSize.size100 * 2.5,
              width: AppSize.sizeWidthApp * 0.45,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/6.png'),
                      fit: BoxFit.cover)),
            ),
          ]),
        ),
        const SizedBox(height: AppSize.size10),
        Container(
          width: AppSize.sizeWidthApp,
          padding: const EdgeInsets.symmetric(horizontal: AppSize.size10),
          child: const TextCustom(
            text: 'Season Review publication 2020/21',
            fontSize: AppSize.size16,
          ),
        ),
        const SizedBox(height: AppSize.size20),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.size10),
          child: Container(
            height: AppSize.size1,
            width: AppSize.sizeWidthApp * 0.4,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              AppColors.grey,
              AppColors.white,
            ])),
          ),
        ),
        const SizedBox(height: AppSize.size20),
        Container(
          width: AppSize.sizeWidthApp,
          padding: const EdgeInsets.symmetric(horizontal: AppSize.size10),
          child: Column(children: [
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SvgPicture.asset('assets/icons/200-download3.svg',
                  color: AppColors.purple),
              Container(
                  width: MediaQuery.of(context).size.width - 36,
                  child: const TextCustom(
                    text: '   DOWNLOAD PDF THE REPORT (6.8MB)',
                    fontSize: AppSize.size14,
                    color: AppColors.purple,
                    weight: FontFamily.medium,
                  ))
            ])
          ]),
        ),
        const SizedBox(height: AppSize.size10),
        Container(
          width: AppSize.sizeWidthApp,
          padding: const EdgeInsets.symmetric(horizontal: AppSize.size10),
          child: Column(children: [
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SvgPicture.asset('assets/icons/200-download3.svg',
                  color: AppColors.purple),
              Container(
                width: MediaQuery.of(context).size.width - 36,
                child: const TextCustom(
                  text: '   DOWNLOAD ACCESSIBLE PDF REPORT (0.2MB)',
                  fontSize: AppSize.size14,
                  color: AppColors.purple,
                  weight: FontFamily.medium,
                ),
              )
            ])
          ]),
        ),
        const SizedBox(
          height: 50,
        )
      ]),
    );
  }
}
