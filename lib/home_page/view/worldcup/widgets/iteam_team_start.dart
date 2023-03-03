import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/details_team/controllers/details_team_controller.dart';
import 'package:worldcup_app/home_page/view/worldcup/widgets/header_squad.dart';
import 'package:worldcup_app/home_page/view/worldcup/widgets/item_row_team.dart';

class ItemTeamStart extends GetView<DetailsTeamController> {
  const ItemTeamStart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaaderSquad(txtHeader: 'Goals', padding: AppSize.size0),
        const SizedBox(height: AppSize.size10),
        for (var i = 0;
            i < controller.listPlayerNormal.dataResponse.length;
            i++)
          ItemRowTeam(
            player: controller.listPlayerNormal.dataResponse[i],
            idx: i,
          ),
      ],
    );
  }
}
