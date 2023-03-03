import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:worldcup_app/config_app/config_app.dart';

class AppStyleCustom {
  AppStyleCustom._();
  static TextStyle getTextStyle({
    double fontSize = AppSize.size13,
    Color color = AppColors.white,
    FontWeight weight = FontFamily.normal,
    TextOverflow? overflow,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: weight,
      color: color,
      overflow: overflow,
    );
  }
}

class TextCustom extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight weight;
  final TextOverflow? overflow;
  final TextAlign? align;
  final FontStyle? fontStyle;
  final double? height;
  final int maxline;

  const TextCustom({
    Key? key,
    this.overflow,
    this.fontSize = AppSize.size13,
    this.color = AppColors.white,
    this.weight = FontFamily.normal,
    required this.text,
    this.align,
    this.fontStyle,
    this.height,
    this.maxline = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: weight,
        color: color,
        overflow: overflow,
        fontStyle: fontStyle,
        height: height,
      ),
      maxLines: maxline,
      textAlign: align,
    );
  }
}

class TextCustomNotAutoScale extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight weight;
  final TextOverflow? overflow;
  final TextAlign? align;
  final FontStyle? fontStyle;
  final double? height;
  final int maxline;

  const TextCustomNotAutoScale({
    Key? key,
    this.overflow,
    this.fontSize = AppSize.size13,
    this.color = AppColors.white,
    this.weight = FontFamily.normal,
    required this.text,
    this.align,
    this.fontStyle,
    this.height,
    this.maxline = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: weight,
        color: color,
        overflow: overflow,
        fontStyle: fontStyle,
        height: height,
      ),
      maxLines: maxline,
      textAlign: align,
    );
  }
}
