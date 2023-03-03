import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_size.dart';

class ItemNotification extends StatelessWidget {
  ItemNotification({super.key});

  bool notification = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 2),
      padding: EdgeInsets.symmetric(horizontal: AppSize.size10),
      height: 40,
      width:AppSize.sizeWidthApp,
      color: AppColors.white,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: const [
            Image(
                image: AssetImage(
                  'assets/images/chelsea.png',
                ),
                height: 30,
                width: 30),
            SizedBox(width: AppSize.size10),
            TextCustom(
                text: 'General Premier League',
                color: AppColors.black,
                fontSize: AppSize.size13),
          ],
        ),
        Switch(
            value: notification,
            onChanged: (bool notification) {
              setState(() {
                notification = true;
              });
            }),
      ]),
    );
  }

  void setState(Null Function() param0) {}
}
