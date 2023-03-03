import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:worldcup_app/app.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/home_page/view/worldcup/widgets/item_man_of_match.dart';
import 'package:worldcup_app/home_page/view/worldcup/widgets/item_title_man.dart';

class ManOfTheMatch extends StatelessWidget {
  const ManOfTheMatch({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: SafeArea(
        child: Column(
          children: [
            HeaderBase(
              text: 'MAN OF THE MATCH',
            ),
            SizedBox(
              height: AppSize.sizeHeightApp - 95,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppSize.size10),
                        height: AppSize.size100 * 1.8,
                        width: AppSize.sizeWidthApp,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const TextCustom(
                                text: 'Man of the Match',
                                fontSize: AppSize.size30,
                                weight: FontFamily.semiBold),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius: BorderRadius.circular(
                                            AppSize.size5)),
                                    height: AppSize.size45,
                                    width: AppSize.sizeWidthApp * 0.5,
                                    child: const TextCustom(
                                        text: 'Matchweek Overview',
                                        color: AppColors.black)),
                                Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius:
                                          BorderRadius.circular(AppSize.size5),
                                    ),
                                    height: AppSize.size45,
                                    width: AppSize.sizeWidthApp * 0.4,
                                    child: const TextCustom(
                                        text: 'Player Stats',
                                        color: AppColors.black)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius: BorderRadius.circular(
                                            AppSize.size5)),
                                    height: AppSize.size45,
                                    width: AppSize.sizeWidthApp * 0.5,
                                    child: const TextCustom(
                                        text: 'MOTM Explained',
                                        color: AppColors.black)),
                              ],
                            ),
                          ],
                        )),
                    Container(
                      color: AppColors.white,
                      child: Column(
                        children: [
                          ItemTitleMan(title: 'Matchweek 8'),
                          ItemTitleMan(title: 'Matchweek 6'),
                          ItemTitleMan(title: 'Matchweek 5'),
                          ItemTitleMan(title: 'Matchweek 4'),
                          ItemTitleMan(title: 'Matchweek 3'),
                          ItemTitleMan(title: 'Matchweek 2'),
                          ItemTitleMan(title: 'Matchweek 1'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
