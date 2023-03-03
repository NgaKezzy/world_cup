import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/home_page/view/more/widgets/item_videos.dart';

class MoreVideo extends StatelessWidget {
  const MoreVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              height: 90,
              padding: const EdgeInsets.symmetric(horizontal: AppSize.size10),
              child: Row(
                children: [
                  // const SizedBox(
                  //   height: 70,
                  // ),
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: AppColors.white,
                      )),
                  TextCustom(
                    text: 'Videos'.tr,
                    fontSize: AppSize.size18,
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                ],
              ),
            ),
            Container(
              color: AppColors.white,
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  ItemVideos(),
                  ItemVideos(),
                  ItemVideos(),
                  ItemVideos(),
                  ItemVideos(),
                  ItemVideos(),
                  ItemVideos(),
                  ItemVideos(),
                  ItemVideos(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
