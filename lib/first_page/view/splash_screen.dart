import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/common/widgets/loading_base.dart';
import 'package:worldcup_app/config_app/config_app.dart';
import 'package:worldcup_app/first_page/view/choose_favourite_team_screen.dart';
import 'package:worldcup_app/first_page/view/football_team_screen.dart';
import 'package:worldcup_app/news/view/latest_new.dart';
import 'package:worldcup_app/home_page/view/stats/stats_screen.dart';
import 'package:worldcup_app/services/api/football_api.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Stack(
        children: [
          Center(child: const Logo()),
          Column(
            children: [
              Spacer(),
              Obx(
                () => Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppSize.size15),
                  child: Column(
                    children: <Widget>[
                      LoadingBase(),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppSize.size70),
            ],
          )
        ],
      ),
    );
  }
}
