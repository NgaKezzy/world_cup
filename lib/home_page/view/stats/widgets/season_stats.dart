import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/common/widgets/TabBarView.dart';
import 'package:worldcup_app/common/widgets/header_view.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/home_page/view/stats/widgets/clubs_season.dart';
import 'package:worldcup_app/home_page/view/stats/widgets/player_season.dart';

class SeasonStats extends StatefulWidget {
  const SeasonStats({super.key});

  @override
  State<SeasonStats> createState() => _SeasonStatsState();
}

class _SeasonStatsState extends State<SeasonStats> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: SafeArea(
        child: Column(
          children: [
            HeaderView(
              "Season Stats",
            ),
            Expanded(
              child: TabBarViewWidget(
                color: AppColors.red_99,
                const <Tab>[
                  Tab(
                    text: 'Player',
                  ),
                  Tab(
                    text: 'Clubs',
                  ),
                ],
                const [
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: PlayerSeason(),
                  ),
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: ClubsSeason(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
