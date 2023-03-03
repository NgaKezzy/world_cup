import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';

// ignore: must_be_immutable
class HeaaderSquad extends StatelessWidget {
  final double padding;
  HeaaderSquad({
    super.key,
    required this.txtHeader,
    this.padding = AppSize.size20,
  });
  String txtHeader;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: AppSize.size30,
      width: AppSize.sizeWidthApp,
      padding: EdgeInsets.only(left: padding),
      child: TextCustom(
        text: txtHeader,
        color: AppColors.black,
        fontSize: AppSize.size16,
        weight: FontFamily.semiBold,
      ),
    );
  }
}
