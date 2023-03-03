import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_size.dart';

class ItemAlerdialog extends StatelessWidget {
  const ItemAlerdialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: AppSize.sizeWidthApp,
      padding: const EdgeInsets.symmetric(horizontal: AppSize.size10),
      child: Row(
        children: const [
          Image(
            image: AssetImage('assets/images/chelsea.png'),
            height: 30,
            width: 30,
          ),
          SizedBox(
            width: 10,
          ),
          TextCustom(
            text: 'Chelsea',
            color: AppColors.black,
          )
        ],
      ),
    );
  }
}
