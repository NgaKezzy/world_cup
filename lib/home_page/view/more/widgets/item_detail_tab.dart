import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_size.dart';

class ItemDetailTab extends StatelessWidget {
  const ItemDetailTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          height: AppSize.size100,
          width: AppSize.sizeWidthApp * 0.3,
          decoration: const BoxDecoration(
            color: Colors.orange,
          ),
        ),
        const SizedBox(
          width: AppSize.size15,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.size10),
          width: AppSize.sizeWidthApp * 0.5,
          child: const TextCustom(
            text: 'Premier League Season Awards',
            fontSize: AppSize.size16,
            color: AppColors.black,
          ),
        ),
      ],
    );
  }
}
