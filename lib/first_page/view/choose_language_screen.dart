import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/common/languages/language.dart';
import 'package:worldcup_app/config_app/config_app.dart';
import 'package:worldcup_app/first_page/controllers/language_select_controller.dart';
import 'package:worldcup_app/first_page/view/choose_favourite_team_screen.dart';

class ChooseLanguageScreen extends GetView<LanguageSelectController> {
  const ChooseLanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Obx(
        () => SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: AppSize.size70),
              const Logo(
                height: AppSize.size90,
              ),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppSize.size15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (var i = 0;
                                i < controller.langs.value.length;
                                i++)
                              InkWell(
                                onTap: () => controller.chooseLanguage(i),
                                child: AnimatedContainer(
                                  duration: const Duration(seconds: 1),
                                  child: Column(
                                    children: [
                                      TextCustom(
                                        text: controller.langs[i].name,
                                        fontSize: controller.langs[i].isActive
                                            ? AppSize.size22
                                            : AppSize.size18,
                                        color: controller.langs[i].isActive
                                            ? AppColors.white
                                            : AppColors.white.withOpacity(.7),
                                      ),
                                      const SizedBox(height: AppSize.size20),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppSize.size25),
                        child: ButtonBase.common(
                          text: 'Choose'.tr,
                          fontSize: AppSize.size16,
                          fontWeight: FontFamily.medium,
                          iconColor: AppColors.transparent,
                          onPressed: controller.setLang,
                          fillColor: AppColors.red_E01,
                        ),
                      ),
                      const SizedBox(height: AppSize.size20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
