import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/app.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/home_page/view/worldcup/widgets/header_squad.dart';
import 'package:worldcup_app/home_page/view/worldcup/widgets/iteam_team_start.dart';

class TabTeam extends StatelessWidget {
  const TabTeam({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.all(AppSize.size15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: Container(
                width: AppSize.sizeWidthApp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.size5),
                  color: AppColors.white,
                ),
                child: ItemTeamStart(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
