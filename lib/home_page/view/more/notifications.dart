import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/app.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/home_page/view/more/widgets/item_notification.dart';

bool notification = false;

class Notifications extends StatelessWidget {
  Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Container(
        height: AppSize.sizeHeightApp,
        width: AppSize.sizeWidthApp,
        padding: EdgeInsets.symmetric(horizontal: AppSize.size10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SafeArea(
                  child: HeaderBase(
                text: 'Notifications'.tr,
              )),
              Container(
                padding: EdgeInsets.symmetric(horizontal: AppSize.size10),
                height: 40,
                width: AppSize.sizeWidthApp,
                color: AppColors.white,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextCustom(
                          text: 'General Premier League',
                          color: AppColors.black,
                          fontSize: AppSize.size13),
                      Switch(
                          value: notification,
                          onChanged: (bool notification) {
                            setState(() {
                              notification = true;
                            });
                          }),
                    ]),
              ),
              const SizedBox(
                height: AppSize.size40,
              ),
              ItemNotification(),
              ItemNotification(),
              ItemNotification(),
              ItemNotification(),
              ItemNotification(),
              ItemNotification(),
              ItemNotification(),
              ItemNotification(),
              ItemNotification(),
              ItemNotification(),
              ItemNotification(),
              ItemNotification(),
              ItemNotification(),
              ItemNotification(),
              ItemNotification(),
              ItemNotification(),
              ItemNotification(),
              ItemNotification(),
              ItemNotification(),
              ItemNotification(),
              ItemNotification(),
              ItemNotification(),
              ItemNotification(),
              ItemNotification(),
            ],
          ),
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}
