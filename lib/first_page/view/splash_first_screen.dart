import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/common/widgets/loading_base.dart';
import 'package:worldcup_app/config_app/config_app.dart';
import 'package:worldcup_app/first_page/controllers/splash_controller.dart';
import 'package:worldcup_app/first_page/view/football_team_screen.dart';
import 'package:worldcup_app/news/view/latest_new.dart';
import 'package:worldcup_app/first_page/view/splash_screen.dart';
import 'package:worldcup_app/home_page/view/stats/stats_screen.dart';

class SplashFirstScreen extends GetView<SplashController> {
  const SplashFirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundPath: 'assets/images/bg_purple.png',
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: AppSize.sizeHeightApp / 4),
            alignment: Alignment.topCenter,
            child: const Logo(
              height: AppSize.size50,
            ),
          ),
          Column(
            children: [
              Spacer(),
              Obx(
                () => controller.isLoading.value
                    ? Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppSize.size15),
                        child: Column(
                          children: <Widget>[
                            LoadingBase(),
                          ],
                        ),
                      )
                    : const SizedBox(),
              ),
              const SizedBox(height: AppSize.size70),
            ],
          )
        ],
      ),
    );
  }
}
