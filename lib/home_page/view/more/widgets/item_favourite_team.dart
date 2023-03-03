import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';

class itemFavouriteTeam extends StatelessWidget {
  itemFavouriteTeam({super.key, required this.text});
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSize.size10),
      margin: const EdgeInsets.only(top: AppSize.size5),
      height: 45,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: AppColors.white),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        TextCustom(
          text: text,
          weight: FontFamily.medium,
        ),
        Icon(Icons.open_in_new, size: 20, color: AppColors.grey)
      ]),
    );
  }
}
