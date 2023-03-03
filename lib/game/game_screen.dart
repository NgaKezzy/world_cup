import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/2048/main.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/config_app/config_app.dart';
import 'package:worldcup_app/flappybird/Core/game_main.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      withScaffold: false,
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: AppSize.size20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.size20),
              child: TextCustom(
                text: 'Mini Games List',
                fontSize: AppSize.size24,
                weight: FontFamily.bold,
              ),
            ),
            const SizedBox(height: AppSize.size10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.size20),
              child: TextCustom(
                text:
                    'Play mini-games while waiting for the match to start or take a break in between',
                align: TextAlign.center,
              ),
            ),
            const SizedBox(height: AppSize.size20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: AppSize.size10),
              padding: const EdgeInsets.symmetric(vertical: AppSize.size5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.size10),
                color: AppColors.white,
              ),
              child: ListTile(
                onTap: () => Get.to(() => GameMainFlappy()),
                tileColor: AppColors.white,
                leading: Image.asset('assets/pics/icon.png'),
                title: TextCustom(
                  text: 'FlappyBall',
                  color: AppColors.pink,
                  weight: FontFamily.bold,
                  fontSize: AppSize.size16,
                ),
                trailing: SvgPicture.asset(
                  'assets/svg/arrow_right.svg',
                  color: AppColors.pink,
                ),
              ),
            ),
            const SizedBox(height: AppSize.size10),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: AppSize.size10),
              padding: const EdgeInsets.symmetric(vertical: AppSize.size5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.size10),
                color: AppColors.white,
              ),
              child: ListTile(
                onTap: () => Get.to(() => Game2048()),
                tileColor: AppColors.white,
                leading: Image.asset('assets/pics/2048.png'),
                title: TextCustom(
                  text: '2048',
                  color: AppColors.pink,
                  weight: FontFamily.bold,
                  fontSize: AppSize.size16,
                ),
                trailing: SvgPicture.asset(
                  'assets/svg/arrow_right.svg',
                  color: AppColors.pink,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
