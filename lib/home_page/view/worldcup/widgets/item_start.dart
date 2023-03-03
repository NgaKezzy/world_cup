import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/config_app/config_app.dart';
import 'package:worldcup_app/home_page/view/worldcup/tab_player.dart';
import 'package:worldcup_app/home_page/view/worldcup/tab_team.dart';

class ItemStart extends StatelessWidget {
  const ItemStart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Column(
        children: [
          SizedBox(
            height: AppSize.sizeHeightApp - 298,
            child: DefaultTabController(
                length: 2,
                child: Column(
                  children: const [
                    TabBar(labelColor: AppColors.black, tabs: [
                      Tab(
                        text: 'Team',
                      ),
                      Tab(
                        text: 'Player',
                      ),
                    ]),
                    Expanded(
                      child: TabBarView(children: [
                        TabTeam(),
                        TabPlayer(),
                      ]),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
