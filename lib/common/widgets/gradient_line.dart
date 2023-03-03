import 'package:flutter/material.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_size.dart';

class GradientLine extends StatelessWidget {
  final double height;
  final double margin;
  final List<Color> colors;
  const GradientLine(
      {Key? key,
      this.height = AppSize.size5,
      this.margin = AppSize.size20,
      this.colors = const [AppColors.red, AppColors.purple]})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: margin),
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
        ),
      ),
    );
  }
}
