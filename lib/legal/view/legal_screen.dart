import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/config_app.dart';

class LegalScreen extends StatelessWidget {
  const LegalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: SafeArea(
        child: Column(
          children: [
            HeaderBase(
              text: 'Legal'.tr,
              onTap: () => Get.back(),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: AppSize.size10),
                color: AppColors.white,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: AppSize.size10),
                      TextCustom(
                        text: 'GOONER GJSC',
                        color: AppColors.black,
                        fontSize: AppSize.size16,
                      ),
                      TextCustom(
                        text: 'Managing director: Jonny Nguyen',
                        color: AppColors.black,
                        fontSize: AppSize.size16,
                      ),
                      SizedBox(height: AppSize.size20),
                      TextCustom(
                        text:
                            'G10 B6 LANE 8 NGO QUYEN, GROUP 13, QUANG TRUNG WARD, HA NOI, HA NOI VIETNAM',
                        color: AppColors.black,
                        fontSize: AppSize.size16,
                      ),
                      SizedBox(height: AppSize.size20),
                      TextCustom(
                        text: 'Head of Quality: Duy Luan',
                        color: AppColors.black,
                        fontSize: AppSize.size16,
                      ),
                      SizedBox(height: AppSize.size20),
                      TextCustom(
                        text: 'Advertise on GOONER',
                        color: AppColors.black,
                        fontSize: AppSize.size16,
                      ),
                      TextCustom(
                        text: 'Tony Truong (Head of Sales)',
                        color: AppColors.black,
                        fontSize: AppSize.size16,
                      ),
                      SizedBox(height: AppSize.size20),
                      TextCustom(
                        text: 'Gtech@goonergame.com',
                        color: AppColors.black,
                        fontSize: AppSize.size16,
                      ),
                      SizedBox(height: AppSize.size20),
                      TextCustom(
                        text: '3rd party feeds:',
                        color: AppColors.black,
                        fontSize: AppSize.size16,
                      ),
                      TextCustom(
                        text: '- API: apifootball.com',
                        color: AppColors.black,
                        fontSize: AppSize.size16,
                      ),
                      TextCustom(
                        text: '- News: goonergame.com',
                        color: AppColors.black,
                        fontSize: AppSize.size16,
                      ),
                      SizedBox(height: AppSize.size20),
                      TextCustom(
                        text: 'Liability',
                        color: AppColors.black,
                        fontSize: AppSize.size16,
                      ),
                      TextCustom(
                        text:
                            'The GOONER GJSC accepts no liability for incorrect or incomplete data inside any of our products. You can find our privacy policy here.',
                        color: AppColors.black,
                        fontSize: AppSize.size16,
                      ),
                      TextCustom(
                        text:
                            'We commit that the above information is valid and legal. For information about copyright, trademark infringement, please contact: tech@gonergame.com for timely support methods.',
                        color: AppColors.black,
                        fontSize: AppSize.size16,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
