import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/config_app.dart';
import 'package:worldcup_app/models/fixture.dart';
import 'package:worldcup_app/models/flag.dart';

class ItemHeadToHead extends StatelessWidget {
  final Color textColor;
  final double sizeFlag;
  final double sizeTextFlag;
  final double sizeTextTime;
  final Color? backgoundTime;
  final EdgeInsetsGeometry padding;
  final bool isResult;
  final Fixture? fixture;
  const ItemHeadToHead({
    super.key,
    this.textColor = AppColors.black,
    this.sizeFlag = AppSize.size25,
    this.sizeTextFlag = AppSize.size18,
    this.sizeTextTime = AppSize.size14,
    this.backgoundTime,
    this.padding = const EdgeInsets.symmetric(
      horizontal: AppSize.size12,
      vertical: AppSize.size0,
    ),
    this.isResult = false,
    this.fixture,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextCustomNotAutoScale(
                text: fixture != null ? fixture!.matchHometeamName : 'GER',
                color: textColor,
                weight: FontFamily.medium,
                fontSize: sizeTextFlag,
              ),
              const SizedBox(width: AppSize.size10),
              SvgPicture.asset(
                fixture != null
                    ? Flag.allFlags[fixture!.matchHometeamName] ??
                        'assets/svg/flag/vn.svg'
                    : 'assets/svg/flag/vn.svg',
                height: sizeFlag,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            margin: padding,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.grey_f2f,
              ),
              color: backgoundTime,
            ),
            child: !isResult
                ? Center(
                    child: TextCustom(
                      text: fixture != null ? fixture!.matchTime : '18:30',
                      color: textColor,
                      fontSize: sizeTextTime,
                      weight: FontFamily.light,
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: AppSize.size5),
                      TextCustom(
                        text: fixture?.matchHometeamScore ?? '',
                        color: textColor,
                        weight: FontFamily.semiBold,
                      ),
                      SizedBox(width: AppSize.size3),
                      TextCustom(
                        text: '|',
                        color: textColor,
                        weight: FontFamily.light,
                      ),
                      SizedBox(width: AppSize.size3),
                      TextCustom(
                        text: fixture?.matchAwayteamScore ?? '',
                        color: textColor,
                        weight: FontFamily.semiBold,
                      ),
                      SizedBox(width: AppSize.size5),
                    ],
                  ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            children: [
              SvgPicture.asset(
                fixture != null
                    ? Flag.allFlags[fixture!.matchAwayteamName] ??
                        'assets/svg/flag/vn.svg'
                    : 'assets/svg/flag/en.svg',
                height: sizeFlag,
              ),
              const SizedBox(width: AppSize.size10),
              TextCustomNotAutoScale(
                text: fixture != null ? fixture!.matchAwayteamName : 'ENG',
                color: textColor,
                weight: FontFamily.medium,
                fontSize: sizeTextFlag,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
