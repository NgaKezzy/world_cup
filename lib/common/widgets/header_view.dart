import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';

class HeaderView extends GetView {
  late String title;
  late Color? colorImageLeft;

  List<Widget>? actions;
  GestureTapCallback? onCallBack;

  HeaderView(this.title, {this.colorImageLeft, this.actions, this.onCallBack});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: AppColors.red_99,
        width: MediaQuery.of(context).size.width,
        height: AppSize.size_header,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.size10),
              height: AppSize.size_header,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/svg/arrow_left.svg',
                          height: AppSize.size20,
                          color: AppColors.white,
                        ),
                        const SizedBox(width: AppSize.size5),
                        const TextCustom(
                          text: "Back",
                          weight: FontFamily.medium,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
