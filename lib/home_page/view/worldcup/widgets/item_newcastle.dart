import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/models/fixture/item_substitution.dart';
import 'package:worldcup_app/models/fixture/lineup_player.dart';
import 'package:worldcup_app/models/flag.dart';

class ItemNewcastle extends StatelessWidget {
  final LineupPlayer? player;
  final String? pathFlag;
  final List<ItemSubstitution>? listSub;
  const ItemNewcastle({super.key, this.player, this.pathFlag, this.listSub});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: AppSize.size1,
          color: AppColors.grey.withOpacity(0.3),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            alignment: Alignment.center,
            height: AppSize.size50 * 1.1 - 1,
            child: TextCustom(
              text: '',
              fontSize: AppSize.size14,
              color: AppColors.black,
            ),
          ),
          const SizedBox(width: AppSize.size10),
          SvgPicture.asset(
            Flag.allFlags[pathFlag] ?? 'assets/svg/flag/vn.svg',
            height: AppSize.size18,
          ),
          const SizedBox(width: AppSize.size15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextCustom(
                text: player!.lineupPlayer.toString(),
                color: AppColors.black,
                weight: FontFamily.semiBold,
                fontSize: AppSize.size12,
              ),
              player!.lineupNumber.isEmpty
                  ? const TextCustom(
                      text: 'Coach',
                      color: AppColors.grey,
                      weight: FontFamily.medium,
                      fontSize: AppSize.size12,
                    )
                  : Row(
                      children: [
                        const TextCustom(
                          text: 'Number:  ',
                          color: AppColors.grey,
                          weight: FontFamily.medium,
                          fontSize: AppSize.size12,
                        ),
                        TextCustom(
                          text: player!.lineupNumber.toString(),
                          color: AppColors.black,
                          weight: FontFamily.semiBold,
                          fontSize: AppSize.size12,
                        ),
                      ],
                    )
            ],
          ),
          const SizedBox(width: AppSize.size20),
          for (var item in listSub!)
            if (item.substitutionPlayerId.contains(player!.playerKey))
              SvgPicture.asset(
                'assets/svg/Swap.svg',
                height: AppSize.size18,
                color: AppColors.red,
              ),
          const Spacer(),
          SvgPicture.asset(
            'assets/svg/arrow_right.svg',
            height: AppSize.size18,
          ),
          const SizedBox(width: AppSize.size10),
        ]),
      ],
    );
  }
}
