import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/app.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/home_page/view/more/widgets/item_alerdialog.dart';

class ShowDialogMore extends StatelessWidget {
  const ShowDialogMore({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
        content: Container(
          width: AppSize.sizeWidthApp,
          height: AppSize.sizeHeightApp - 150,
          color: AppColors.white,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: AppSize.size10),
                height: 40,
                width: AppSize.sizeWidthApp,
                color: AppColors.purple,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       TextCustom(
                        text: 'Pickyourteam'.tr,
                      ),
                      InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(Icons.close, color: AppColors.white))
                    ]),
              ),
              ItemAlerdialog(),
              ItemAlerdialog(),
              ItemAlerdialog(),
              ItemAlerdialog(),
              ItemAlerdialog(),
              ItemAlerdialog(),
              ItemAlerdialog(),
              ItemAlerdialog(),
              ItemAlerdialog(),
              ItemAlerdialog(),
              ItemAlerdialog(),
              ItemAlerdialog(),
              ItemAlerdialog(),
              ItemAlerdialog(),
              ItemAlerdialog(),
              ItemAlerdialog(),
              ItemAlerdialog(),
              ItemAlerdialog(),
              ItemAlerdialog(),
              ItemAlerdialog(),
              ItemAlerdialog(),
            ]),
          ),
        ),
      ),
    );
  }
}
