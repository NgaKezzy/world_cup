import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/detail_match/controllers/details_match_controller.dart';
import 'package:worldcup_app/home_page/view/worldcup/widgets/billboards_latest.dart';
import 'package:worldcup_app/home_page/view/worldcup/widgets/item_Lastest_fulltime.dart';
import 'package:worldcup_app/home_page/view/worldcup/widgets/item_lastest_messaenger.dart';
import 'package:worldcup_app/home_page/view/worldcup/widgets/item_lastest_substution.dart';
import 'package:worldcup_app/home_page/view/worldcup/widgets/item_lastest_var.dart';
import 'package:worldcup_app/home_page/view/worldcup/widgets/item_latest_not_started_yet.dart';
import 'package:worldcup_app/home_page/view/worldcup/widgets/item_yellow_card.dart';
import 'package:worldcup_app/models/fixture/card.dart' as card;
import 'package:worldcup_app/models/fixture/goalscorer.dart';

class Latest extends GetView<DetailsMatchController> {
  const Latest({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const BillboardsLatest(),
          const SizedBox(height: AppSize.size10),
          Column(
            children: [
              for (GoalScorer info
                  in controller.dataStatisticMatch.dataResponse[0].goalscorer)
                ItemYellowCard(
                  time: info.time,
                  infomation: info.homeScorer.isNotEmpty
                      ? info.homeScorer
                      : info.awayScorer,
                  teamName: info.homeScorer.isNotEmpty
                      ? controller
                          .dataStatisticMatch.dataResponse[0].matchHometeamName
                      : controller
                          .dataStatisticMatch.dataResponse[0].matchAwayteamName,
                  type: 'Goal',
                ),
              for (card.Card info
                  in controller.dataStatisticMatch.dataResponse[0].cards)
                ItemYellowCard(
                  time: info.time,
                  infomation: info.homeFault.isNotEmpty
                      ? info.homeFault
                      : info.awayFault,
                  type: info.card,
                  teamName: info.homeFault.isNotEmpty
                      ? controller
                          .dataStatisticMatch.dataResponse[0].matchHometeamName
                      : controller
                          .dataStatisticMatch.dataResponse[0].matchAwayteamName,
                ),
            ],
          ),

          const SizedBox(height: AppSize.size50)
        ],
      ),
    );
  }
}
