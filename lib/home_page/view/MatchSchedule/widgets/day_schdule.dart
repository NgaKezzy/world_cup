import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/home_page/view/MatchSchedule/widgets/item_match_schdule.dart';
import 'package:worldcup_app/home_page/view/MatchSchedule/widgets/item_schdule_play.dart';

class DaySchdule extends StatelessWidget {
  const DaySchdule({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SizedBox(
          height: AppSize.size10,
        ),
        TextCustom(text: 'Chủ nhật, ngày 25/09/2022'),
        ItemSchdulePlay(),
        ItemSchdulePlay(),
        ItemMatchSchdule(),
        ItemMatchSchdule(),
      ],
    );
  }
}
