import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/home_page/view/worldcup/widgets/item_newcastle.dart';
import 'package:worldcup_app/models/fixture/item_substitution.dart';
import 'package:worldcup_app/models/fixture/lineup_player.dart';
import 'package:worldcup_app/models/lineup_details.dart';

class TabNewcastle extends StatelessWidget {
  final LineUpDetails lineUpDetails;
  final List<ItemSubstitution> listSub;
  final String? path;
  const TabNewcastle(
      {super.key,
      required this.lineUpDetails,
      required this.listSub,
      this.path});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: AppSize.size10, vertical: AppSize.size20),
        child: Column(
          children: [
            _buildItemListPosition(
                listData: lineUpDetails.coach, label: 'Coach'.tr),
            _buildItemListPosition(
                listData: lineUpDetails.startingLineups,
                label: 'StartingLineUp'.tr),
            _buildItemListPosition(
                listData: lineUpDetails.substitutes, label: 'Substitutes'.tr),
            if (lineUpDetails.missingPlayers.isNotEmpty)
              _buildItemListPosition(
                  listData: lineUpDetails.missingPlayers,
                  label: 'Missing players'),
          ],
        ),
      ),
    );
  }

  Widget _buildItemListPosition(
      {String label = 'Player', required List<LineupPlayer> listData}) {
    return Column(
      children: [
        Row(
          children: [
            TextCustom(
              text: label,
              fontSize: AppSize.size14,
              color: AppColors.black,
              weight: FontFamily.semiBold,
            ),
          ],
        ),
        const SizedBox(height: AppSize.size15),
        SizedBox(
          width: AppSize.sizeWidthApp,
          child: Column(
            children: [
              for (var player in listData)
                ItemNewcastle(
                  player: player,
                  pathFlag: path,
                  listSub: listSub,
                ),
            ],
          ),
        ),
        const SizedBox(height: AppSize.size15),
      ],
    );
  }
}
