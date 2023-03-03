import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/common/widgets/header_base.dart';
import 'package:worldcup_app/common/widgets/header_view.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';

class GoalsPlayer extends StatefulWidget {
  const GoalsPlayer({super.key});

  @override
  State<GoalsPlayer> createState() => _GoalsPlayerState();
}

class _GoalsPlayerState extends State<GoalsPlayer> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: SafeArea(
        child: Column(
          children: [
            HeaderView(
              "Players",
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSize.size16, vertical: AppSize.size16),
                      child: Row(
                        children: [
                          Column(
                            children: const [
                              Text(
                                "Goals",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                "2022/23",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Expanded(child: Container()),
                          Container(
                            margin: const EdgeInsets.only(left: 16),
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.white,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Powered by",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  "ORACLE CLOUD",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 20,
                                      letterSpacing: 1),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSize.size16, vertical: AppSize.size16),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 6),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                TextCustom(
                                  text: "1",
                                  color: AppColors.pink,
                                  fontSize: AppSize.size18,
                                  weight: FontFamily.semiBold,
                                ),
                                TextCustom(
                                  text: "Erling Haaland",
                                  fontSize: AppSize.size18,
                                  color: AppColors.white,
                                  weight: FontFamily.semiBold,
                                ),
                                TextCustom(
                                  text: "Manchester City",
                                  color: AppColors.white,
                                  fontSize: 14,
                                ),
                                TextCustom(
                                  text: "11",
                                  color: AppColors.pink,
                                  fontSize: AppSize.size24,
                                  weight: FontFamily.semiBold,
                                ),
                              ],
                            ),
                          ),
                          Expanded(child: Container()),
                          Container(
                            margin: EdgeInsets.only(right: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "assets/svg/ronaldo.jpg",
                                  width: 150,
                                  height: 150,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: AppColors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSize.size12, vertical: AppSize.size12),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const TextCustom(
                                text: "Pos",
                                color: AppColors.grey,
                              ),
                              const SizedBox(width: 8),
                              const TextCustom(
                                text: "Player",
                                color: AppColors.grey,
                              ),
                              Expanded(child: Container()),
                              const TextCustom(
                                text: "Team",
                                color: AppColors.grey,
                              ),
                              const SizedBox(width: 24),
                              const TextCustom(
                                text: "Value",
                                color: AppColors.grey,
                              ),
                            ],
                          ),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: 15,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: AppSize.size2,
                                    vertical: AppSize.size8),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const TextCustom(
                                          text: "1",
                                          color: AppColors.black,
                                          weight: FontWeight.w600,
                                        ),
                                        const SizedBox(width: 8),
                                        const TextCustom(
                                          text: "Harry Kane",
                                          color: AppColors.black,
                                          weight: FontWeight.w600,
                                        ),
                                        Expanded(child: Container()),
                                        Image.asset(
                                          "assets/svg/logo_man.jpg",
                                          width: 24,
                                        ),
                                        const SizedBox(width: 16),
                                        const TextCustom(
                                          text: "TOT",
                                          color: AppColors.black,
                                        ),
                                        const SizedBox(width: 24),
                                        const TextCustom(
                                          text: "6",
                                          color: AppColors.black,
                                          weight: FontWeight.w600,
                                        ),
                                      ],
                                    ),
                                    const Divider(
                                        color: AppColors.grey, height: 1)
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
