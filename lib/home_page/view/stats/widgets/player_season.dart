import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:worldcup_app/common/widgets/text_base.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';

class PlayerSeason extends StatefulWidget {
  const PlayerSeason({super.key});

  @override
  State<PlayerSeason> createState() => _PlayerSeasonState();
}

class _PlayerSeasonState extends State<PlayerSeason> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppColors.white,
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  TextCustomNotAutoScale(
                    text: "Season",
                    color: AppColors.purple,
                    fontSize: AppSize.size10,
                    weight: FontFamily.medium,
                  ),
                  TextCustomNotAutoScale(
                    text: "2022/23",
                    color: AppColors.black,
                    fontSize: AppSize.size11,
                    weight: FontFamily.medium,
                  ),
                ],
              ),
              Icon(Icons.arrow_drop_down)
            ],
          ),
        ),
        const SizedBox(height: AppSize.size15),
        Container(
          padding: const EdgeInsets.symmetric(vertical: AppSize.size5),
          width: double.infinity,
          color: AppColors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              TextCustomNotAutoScale(
                text: "Powered by",
                color: AppColors.black,
                fontSize: AppSize.size10,
                fontStyle: FontStyle.italic,
              ),
              TextCustomNotAutoScale(
                text: "ORACLE CLOUD",
                color: AppColors.red,
                fontSize: AppSize.size20,
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSize.size12),
        Container(
          color: AppColors.white,
          padding: const EdgeInsets.symmetric(
            vertical: AppSize.size10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSize.size10,
                ),
                child: const TextCustom(
                  text: "Wins",
                  color: AppColors.black,
                  fontSize: AppSize.size14,
                  weight: FontFamily.semiBold,
                ),
              ),
              Stack(
                children: [
                  Container(
                    color: AppColors.grey_f2f,
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSize.size10,
                      vertical: AppSize.size40,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              TextCustom(
                                text: "1",
                                color: AppColors.black,
                                fontSize: AppSize.size16,
                                weight: FontFamily.semiBold,
                              ),
                              TextCustom(
                                text: "Timo Werner",
                                fontSize: AppSize.size16,
                                color: AppColors.black,
                                weight: FontFamily.semiBold,
                              ),
                              TextCustom(
                                text: "Germany",
                                fontSize: AppSize.size12,
                                color: AppColors.black,
                                weight: FontFamily.light,
                              ),
                              TextCustom(
                                text: "6",
                                color: AppColors.pink,
                                fontSize: AppSize.size16,
                                weight: FontFamily.semiBold,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: AppSize.size20,
                    child: Image.asset(
                      "assets/images/player.png",
                      height: AppSize.size150,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Container(
          color: AppColors.white,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSize.size10,
          ),
          child: Column(
            children: [
              for (var i = 0; i < 2; i++)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: AppSize.size10,
                      ),
                      child: Row(
                        children: [
                          const TextCustom(
                            text: "2",
                            color: AppColors.black,
                            weight: FontFamily.semiBold,
                          ),
                          const SizedBox(width: AppSize.size10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const TextCustom(
                                text: "Timor Werner",
                                color: AppColors.black,
                                weight: FontFamily.semiBold,
                              ),
                              const TextCustom(
                                text: "Germany",
                                color: AppColors.grey,
                                weight: FontFamily.semiBold,
                              ),
                            ],
                          ),
                          Expanded(child: Container()),
                          SvgPicture.asset(
                            "assets/svg/flag/vn.svg",
                            width: AppSize.size30,
                          ),
                          const SizedBox(width: AppSize.size24),
                          const TextCustom(
                            text: "6",
                            color: AppColors.black,
                            weight: FontFamily.semiBold,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: AppSize.size0,
                      color: AppColors.grey_f2f,
                      thickness: AppSize.size2,
                    ),
                  ],
                ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: AppSize.size10),
                child: Row(
                  children: [
                    Expanded(child: Container()),
                    const TextCustom(
                      text: "View Full Table",
                      color: AppColors.black,
                      weight: FontFamily.medium,
                    ),
                    const SizedBox(width: AppSize.size10),
                    SvgPicture.asset(
                      'assets/svg/arrow_right.svg',
                      height: AppSize.size20,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSize.size10),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var i = 0; i < 2; i++)
                Container(
                  color: AppColors.white,
                  width: AppSize.sizeWidthApp / 2 - 5,
                  padding: const EdgeInsets.symmetric(vertical: AppSize.size10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppSize.size10),
                        child: const TextCustom(
                          text: "Shots",
                          fontSize: AppSize.size13,
                          color: AppColors.black,
                          weight: FontFamily.semiBold,
                        ),
                      ),
                      const SizedBox(height: AppSize.size10),
                      Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: AppSize.size30),
                            color: AppColors.grey_f2f,
                            child: SizedBox(
                              height: AppSize.size70,
                              width: double.infinity,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: AppSize.size40,
                            child: Image.asset(
                              "assets/images/player.png",
                              height: AppSize.size_logo,
                            ),
                          )
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSize.size10,
                          vertical: AppSize.size10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TextCustom(
                              text: "1",
                              color: AppColors.black,
                              fontSize: AppSize.size14,
                              weight: FontFamily.semiBold,
                            ),
                            const TextCustom(
                              text: "Germany",
                              color: AppColors.black,
                              fontSize: AppSize.size14,
                            ),
                            const TextCustom(
                              text: "6",
                              color: AppColors.pink,
                              fontSize: AppSize.size18,
                              weight: FontFamily.semiBold,
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: AppSize.size0,
                        color: AppColors.grey_f2f,
                        thickness: AppSize.size1,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          top: AppSize.size10,
                          left: AppSize.size10,
                          right: AppSize.size10,
                        ),
                        child: Row(
                          children: [
                            Expanded(child: Container()),
                            const TextCustom(
                              text: "View Full Table",
                              color: AppColors.black,
                              weight: FontFamily.medium,
                            ),
                            const SizedBox(width: AppSize.size10),
                            SvgPicture.asset(
                              'assets/svg/arrow_right.svg',
                              height: AppSize.size20,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: AppSize.size12),
        Container(
          color: AppColors.white,
          padding: const EdgeInsets.symmetric(
            vertical: AppSize.size10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSize.size10,
                ),
                child: const TextCustom(
                  text: "Wins",
                  color: AppColors.black,
                  fontSize: AppSize.size14,
                  weight: FontFamily.semiBold,
                ),
              ),
              Stack(
                children: [
                  Container(
                    color: AppColors.grey_f2f,
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSize.size10,
                      vertical: AppSize.size40,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              TextCustom(
                                text: "1",
                                color: AppColors.black,
                                fontSize: AppSize.size16,
                                weight: FontFamily.semiBold,
                              ),
                              TextCustom(
                                text: "Timo Werner",
                                fontSize: AppSize.size16,
                                color: AppColors.black,
                                weight: FontFamily.semiBold,
                              ),
                              TextCustom(
                                text: "Germany",
                                fontSize: AppSize.size12,
                                color: AppColors.black,
                                weight: FontFamily.light,
                              ),
                              TextCustom(
                                text: "6",
                                color: AppColors.pink,
                                fontSize: AppSize.size16,
                                weight: FontFamily.semiBold,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: AppSize.size20,
                    child: Image.asset(
                      "assets/images/player.png",
                      height: AppSize.size150,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Container(
          color: AppColors.white,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSize.size10,
          ),
          child: Column(
            children: [
              for (var i = 0; i < 2; i++)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: AppSize.size10,
                      ),
                      child: Row(
                        children: [
                          const TextCustom(
                            text: "2",
                            color: AppColors.black,
                            weight: FontFamily.semiBold,
                          ),
                          const SizedBox(width: AppSize.size10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const TextCustom(
                                text: "Timor Werner",
                                color: AppColors.black,
                                weight: FontFamily.semiBold,
                              ),
                              const TextCustom(
                                text: "Germany",
                                color: AppColors.grey,
                                weight: FontFamily.semiBold,
                              ),
                            ],
                          ),
                          Expanded(child: Container()),
                          SvgPicture.asset(
                            "assets/svg/flag/vn.svg",
                            width: AppSize.size30,
                          ),
                          const SizedBox(width: AppSize.size24),
                          const TextCustom(
                            text: "6",
                            color: AppColors.black,
                            weight: FontFamily.semiBold,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: AppSize.size0,
                      color: AppColors.grey_f2f,
                      thickness: AppSize.size2,
                    ),
                  ],
                ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: AppSize.size10),
                child: Row(
                  children: [
                    Expanded(child: Container()),
                    const TextCustom(
                      text: "View Full Table",
                      color: AppColors.black,
                      weight: FontFamily.medium,
                    ),
                    const SizedBox(width: AppSize.size10),
                    SvgPicture.asset(
                      'assets/svg/arrow_right.svg',
                      height: AppSize.size20,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSize.size10),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var i = 0; i < 2; i++)
                Container(
                  color: AppColors.white,
                  width: AppSize.sizeWidthApp / 2 - 5,
                  padding: const EdgeInsets.symmetric(vertical: AppSize.size10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppSize.size10),
                        child: const TextCustom(
                          text: "Shots",
                          fontSize: AppSize.size13,
                          color: AppColors.black,
                          weight: FontFamily.semiBold,
                        ),
                      ),
                      const SizedBox(height: AppSize.size10),
                      Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: AppSize.size30),
                            color: AppColors.grey_f2f,
                            child: SizedBox(
                              height: AppSize.size70,
                              width: double.infinity,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: AppSize.size40,
                            child: Image.asset(
                              "assets/images/player.png",
                              height: AppSize.size_logo,
                            ),
                          )
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSize.size10,
                          vertical: AppSize.size10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TextCustom(
                              text: "1",
                              color: AppColors.black,
                              fontSize: AppSize.size14,
                              weight: FontFamily.semiBold,
                            ),
                            const TextCustom(
                              text: "Germany",
                              color: AppColors.black,
                              fontSize: AppSize.size14,
                            ),
                            const TextCustom(
                              text: "6",
                              color: AppColors.pink,
                              fontSize: AppSize.size18,
                              weight: FontFamily.semiBold,
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: AppSize.size0,
                        color: AppColors.grey_f2f,
                        thickness: AppSize.size1,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          top: AppSize.size10,
                          left: AppSize.size10,
                          right: AppSize.size10,
                        ),
                        child: Row(
                          children: [
                            Expanded(child: Container()),
                            const TextCustom(
                              text: "View Full Table",
                              color: AppColors.black,
                              weight: FontFamily.medium,
                            ),
                            const SizedBox(width: AppSize.size10),
                            SvgPicture.asset(
                              'assets/svg/arrow_right.svg',
                              height: AppSize.size20,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: AppSize.size10),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.all(AppSize.size10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextCustom(
                text: "General",
                color: AppColors.black,
                fontSize: AppSize.size18,
                weight: FontFamily.medium,
              ),
              for (var i = 0; i < 2; i++)
                Column(
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.symmetric(vertical: AppSize.size10),
                      child: Row(
                        children: [
                          const TextCustom(
                            text: "Most Passes",
                            color: AppColors.black,
                          ),
                          Expanded(child: Container()),
                          SvgPicture.asset(
                            'assets/svg/arrow_right.svg',
                            height: AppSize.size20,
                          )
                        ],
                      ),
                    ),
                    Divider(
                      height: AppSize.size0,
                      color: AppColors.grey_f2f,
                      thickness: AppSize.size1,
                    ),
                  ],
                ),
            ],
          ),
        ),
        const SizedBox(height: AppSize.size5),
        Container(
          color: AppColors.white,
          padding: const EdgeInsets.all(AppSize.size10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextCustom(
                text: "Attack",
                color: AppColors.black,
                fontSize: AppSize.size18,
                weight: FontFamily.medium,
              ),
              for (var i = 0; i < 3; i++)
                Column(
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.symmetric(vertical: AppSize.size10),
                      child: Row(
                        children: [
                          const TextCustom(
                            text: "Most Passes",
                            color: AppColors.black,
                          ),
                          Expanded(child: Container()),
                          SvgPicture.asset(
                            'assets/svg/arrow_right.svg',
                            height: AppSize.size20,
                          )
                        ],
                      ),
                    ),
                    Divider(
                      height: AppSize.size0,
                      color: AppColors.grey_f2f,
                      thickness: AppSize.size1,
                    ),
                  ],
                ),
            ],
          ),
        ),
        const SizedBox(height: AppSize.size5),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.all(AppSize.size10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextCustom(
                text: "Defence",
                color: AppColors.black,
                fontSize: AppSize.size18,
                weight: FontFamily.medium,
              ),
              for (var i = 0; i < 2; i++)
                Column(
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.symmetric(vertical: AppSize.size10),
                      child: Row(
                        children: [
                          const TextCustom(
                            text: "Most Passes",
                            color: AppColors.black,
                          ),
                          Expanded(child: Container()),
                          SvgPicture.asset(
                            'assets/svg/arrow_right.svg',
                            height: AppSize.size20,
                          )
                        ],
                      ),
                    ),
                    Divider(
                      height: AppSize.size0,
                      color: AppColors.grey_f2f,
                      thickness: AppSize.size1,
                    ),
                  ],
                ),
            ],
          ),
        ),
        const SizedBox(height: AppSize.size5),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.all(AppSize.size10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextCustom(
                text: "Team Play",
                color: AppColors.black,
                fontSize: AppSize.size18,
                weight: FontFamily.medium,
              ),
              for (var i = 0; i < 2; i++)
                Column(
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.symmetric(vertical: AppSize.size10),
                      child: Row(
                        children: [
                          const TextCustom(
                            text: "Most Passes",
                            color: AppColors.black,
                          ),
                          Expanded(child: Container()),
                          SvgPicture.asset(
                            'assets/svg/arrow_right.svg',
                            height: AppSize.size20,
                          )
                        ],
                      ),
                    ),
                    Divider(
                      height: AppSize.size0,
                      color: AppColors.grey_f2f,
                      thickness: AppSize.size1,
                    ),
                  ],
                ),
            ],
          ),
        ),
        const SizedBox(
          height: AppSize.size30,
        )
      ],
    );
  }
}
