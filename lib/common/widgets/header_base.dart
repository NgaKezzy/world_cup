import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:worldcup_app/common/widgets/widgets.dart';
import 'package:worldcup_app/config_app/config_app.dart';

class HeaderBase extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final bool enable;
  final String text;
  final Function()? onTap;
  final Widget? child;
  const HeaderBase(
      {super.key,
      this.margin = const EdgeInsets.only(
        top: AppSize.size15,
        bottom: AppSize.size20,
        left: AppSize.size15,
        right: AppSize.size20,
      ),
      this.enable = true,
      required this.text,
      this.onTap,
      this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Row(
        children: [
          if (enable)
            InkWell(
              onTap: onTap,
              child: SvgPicture.asset(
                'assets/svg/arrow_left.svg',
                color: AppColors.white.withOpacity(0.7),
                height: AppSize.size28,
              ),
            ),
          const SizedBox(width: AppSize.size30),
          TextCustom(
            text: text,
            fontSize: AppSize.size18,
            weight: FontFamily.medium,
          ),
          Spacer(),
          if (child != null) child!,
        ],
      ),
    );
  }
}
