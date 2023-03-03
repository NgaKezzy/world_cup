import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/config_app.dart';

class ButtonBase extends StatelessWidget {
  final Widget child;
  final void Function()? onPressed;
  final Color? fillColor;
  final Color? splashColor;
  final ShapeBorder shape;
  final String? text;
  final Color? textColor;
  final Color? iconColor;
  final String pathIcon;
  final double fontSize;
  final FontWeight fontWeight;
  final double? sizeIcon;
  const ButtonBase({
    Key? key,
    required this.child,
    this.onPressed,
    this.fillColor = AppColors.red,
    this.splashColor,
    this.shape = const RoundedRectangleBorder(),
    this.text,
    this.textColor,
    this.iconColor,
    this.pathIcon = 'assets/svg/arrow_right.svg',
    this.fontSize = AppSize.size13,
    this.fontWeight = FontFamily.semiBold,
    this.sizeIcon,
  }) : super(key: key);

  ButtonBase.common(
      {this.fillColor,
      this.splashColor,
      this.onPressed,
      this.iconColor = AppColors.white,
      this.textColor = AppColors.white,
      this.pathIcon = 'assets/svg/arrow_right.svg',
      this.fontSize = AppSize.size13,
      this.fontWeight = FontFamily.semiBold,
      this.sizeIcon,
      required this.text,
      Key? key})
      : child = Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSize.size17),
          child: Stack(
            children: [
              Center(
                child: TextCustom(
                  text: text!,
                  weight: fontWeight,
                  color: textColor!,
                  fontSize: fontSize,
                ),
              ),
              Positioned(
                right: AppSize.size10,
                child: SvgPicture.asset(
                  pathIcon,
                  color: iconColor,
                  height: sizeIcon,
                ),
              ),
            ],
          ),
        ),
        shape = RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.size5),
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      fillColor: fillColor,
      splashColor: splashColor,
      shape: shape,
      child: child,
      elevation: 0,
    );
  }
}
