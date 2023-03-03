import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/app.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/detail_match/controllers/details_match_controller.dart';
import 'package:worldcup_app/home_page/view/worldcup/widgets/tab_newcastle.dart';

class LineUp extends GetView<DetailsMatchController> {
  const LineUp({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const SizedBox(height: AppSize.size15),
          Container(
            color: AppColors.white,
            child: TabBar(
              labelColor: AppColors.black,
              tabs: [
                Tab(
                  text: controller
                      .dataStatisticMatch.dataResponse[0].matchHometeamName,
                ),
                Tab(
                  text: controller
                      .dataStatisticMatch.dataResponse[0].matchAwayteamName,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: AppColors.white,
              child: TabBarView(
                children: [
                  TabNewcastle(
                    lineUpDetails: controller
                        .dataStatisticMatch.dataResponse[0].lineup.home,
                    path: controller
                        .dataStatisticMatch.dataResponse[0].matchHometeamName,
                    listSub: controller
                        .dataStatisticMatch.dataResponse[0].substitutions.home,
                  ),
                  TabNewcastle(
                    lineUpDetails: controller
                        .dataStatisticMatch.dataResponse[0].lineup.away,
                    path: controller
                        .dataStatisticMatch.dataResponse[0].matchAwayteamName,
                    listSub: controller
                        .dataStatisticMatch.dataResponse[0].substitutions.away,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
