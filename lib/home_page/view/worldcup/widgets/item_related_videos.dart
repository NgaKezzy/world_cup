import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_size.dart';

class ItemrelatedVideos extends StatelessWidget {
  const ItemrelatedVideos({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 15,
      ),
      height: AppSize.size100 * 0.9,
      width: AppSize.sizeWidthApp,
      child: Row(
        children: [
          Container(
            height: AppSize.size100,
            width: AppSize.sizeWidthApp * 0.4,
            color: AppColors.grey,
          ),
          Container(
            width: AppSize.sizeWidthApp * 0.5 - 4,
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                // TextCustom(
                //     text: 'News',
                //     color: AppColors.red,
                //     fontSize: AppSize.size15),
                TextCustom(
                    text: 'Club and fans pay tribute to Quên Elizabeth II',
                    color: AppColors.black,
                    fontSize: AppSize.size15),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
