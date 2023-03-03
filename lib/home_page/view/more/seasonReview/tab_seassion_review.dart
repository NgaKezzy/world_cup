import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/home_page/view/more/seasonReview/event_fans.dart';
import 'package:worldcup_app/home_page/view/more/seasonReview/event_foodball.dart';
import 'package:worldcup_app/home_page/view/more/seasonReview/event_force.dart';
import 'package:worldcup_app/home_page/view/more/seasonReview/event_no_room.dart';

class TabSeasionReview extends StatelessWidget {
  const TabSeasionReview({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: SafeArea(
        child: Column(
          children: [
             HeaderBase(
              text: 'SeasonReview'.tr,
            ),
            Container(
              color: AppColors.white,
              height: AppSize.sizeHeightApp- 105,
              child: DefaultTabController(
                length: 4,
                child: Column(
                  children:  [
                    TabBar(
                        isScrollable: true,
                        labelColor: AppColors.black,
                        tabs: [
                          Tab(
                            text: 'Foodball'.tr,
                          ),
                          Tab(
                            text: 'NoRoomForRacism'.tr,
                          ),
                          Tab(
                            text: 'fans'.tr,
                          ),
                          Tab(
                            text: 'Related',
                          ),
                        ]),
                    const Expanded(
                        child: TabBarView(children: [
                      EventFoodball(),
                      EventNoRoom(),
                      EventFans(),
                      EventForce(),
                    ])),
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
