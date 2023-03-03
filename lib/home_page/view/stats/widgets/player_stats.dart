import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/home_page/view/stats/widgets/item_player_stats.dart';

class PlayerStats extends StatelessWidget {
  const PlayerStats({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        child: SafeArea(
            child: Column(
      children: [
        HeaderBase(text: 'Player'),
        SizedBox(
          height: AppSize.sizeHeightApp - 95,
          width: AppSize.sizeWidthApp,
          child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        height: AppSize.size60,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const TextCustom(
                                  text: 'Asists',
                                  fontSize: AppSize.size20,
                                  weight: FontFamily.semiBold),
                              Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: AppColors.white,
                                  ),
                                  height: AppSize.size60,
                                  width: AppSize.size100 * 1.45,
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      TextCustomNotAutoScale(
                                        text: "Powered by",
                                        color: AppColors.black,
                                        fontSize: AppSize.size8,
                                        fontStyle: FontStyle.italic,
                                      ),
                                      TextCustomNotAutoScale(
                                        text: "ORACLE CLOUD",
                                        color: AppColors.red,
                                        fontSize: AppSize.size16,
                                      ),
                                    ],
                                  ))
                            ]),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(
                          left: AppSize.size10,
                        ),
                        child: TextCustom(
                            text: 'Current Season', fontSize: AppSize.size16),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        padding: const EdgeInsets.only(left: 20, right: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppSize.size5),
                            color: AppColors.purple),
                        width: AppSize.sizeWidthApp,
                        height: AppSize.size100 * 1.9,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  TextCustom(
                                      text: '1',
                                      fontSize: AppSize.size20,
                                      weight: FontFamily.semiBold,
                                      color: AppColors.pink),
                                  TextCustom(
                                    text: 'Kevin De Bruyne',
                                    fontSize: AppSize.size16,
                                    weight: FontFamily.semiBold,
                                  ),
                                  TextCustom(
                                    text: 'Manchester City',
                                  ),
                                  TextCustom(
                                      text: '6',
                                      fontSize: AppSize.size30,
                                      weight: FontFamily.semiBold,
                                      color: AppColors.pink),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Stack(
                                    alignment: Alignment.bottomRight,
                                    children: [
                                      Container(
                                        width: AppSize.sizeWidthApp * 0.4,
                                        height: AppSize.size100 * 1.7,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/player.png'),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 20,
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: AppSize.size50,
                                          height: AppSize.size50,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColors.white),
                                          child: SvgPicture.asset(
                                              'assets/svg/mu.svg',
                                              height: AppSize.size40),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ]),
                      ),
                      Container(
                        width: AppSize.sizeWidthApp,
                        color: AppColors.white,
                        child: Column(
                          children: [
                            Container(
                              height: AppSize.size30,
                              color: AppColors.grey.withOpacity(0.4),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const SizedBox(width: AppSize.size15),
                                    SizedBox(
                                      width: AppSize.sizeWidthApp * 0.1,
                                      child: const TextCustom(
                                          text: 'Post', color: AppColors.black),
                                    ),
                                    Container(
                                        padding: const EdgeInsets.only(
                                            left: AppSize.size20),
                                        width: AppSize.sizeWidthApp * 0.5 - 30,
                                        child: const TextCustom(
                                            text: 'Player',
                                            color: AppColors.black)),
                                    Container(
                                        width: AppSize.sizeWidthApp * 0.2,
                                        child: const TextCustom(
                                            text: 'Team',
                                            color: AppColors.black)),
                                    Container(
                                        alignment: Alignment.centerRight,
                                        width: AppSize.sizeWidthApp * 0.2,
                                        child: const TextCustom(
                                            text: 'Value',
                                            color: AppColors.black)),
                                    const SizedBox(width: AppSize.size15),
                                  ]),
                            ),
                            Column(children: const [
                              ItemPlayerStats(),
                              ItemPlayerStats(),
                              ItemPlayerStats(),
                              ItemPlayerStats(),
                              ItemPlayerStats(),
                              ItemPlayerStats(),
                              ItemPlayerStats(),
                              ItemPlayerStats(),
                              ItemPlayerStats(),
                              ItemPlayerStats(),
                              ItemPlayerStats(),
                              ItemPlayerStats(),
                              ItemPlayerStats(),
                              ItemPlayerStats(),
                              ItemPlayerStats(),
                            ]),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              )),
        )
      ],
    )));
  }
}
