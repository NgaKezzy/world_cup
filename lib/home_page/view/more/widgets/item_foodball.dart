import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/home_page/view/more/seasonReview/detail_foodball.dart';

class ItemFoodball extends StatelessWidget {
  const ItemFoodball({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Get.to(DetailFoodbal());
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: AppSize.size15),
                alignment: Alignment.center,
                height: AppSize.size35,
                width: AppSize.sizeWidthApp * 0.3,
                decoration: BoxDecoration(
                    color: AppColors.pink,
                    borderRadius: BorderRadius.circular(5)),
                child: const TextCustom(
                    text: "The Foodball",
                    fontSize: AppSize.size10,
                    color: AppColors.black),
              ),
              const SizedBox(height: AppSize.size10),
              Container(
                width: AppSize.sizeWidthApp,
                child: const TextCustom(
                  text: "Gripping drama in a unique campaign",
                  color: AppColors.black,
                  fontSize: AppSize.size18,
                ),
              ),
              const SizedBox(height: AppSize.size10),
              Container(
                height: AppSize.size100 * 2,
                width: AppSize.sizeWidthApp,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/ngoaihang.jpg'),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(height: AppSize.size10),
              SizedBox(
                  width: AppSize.sizeWidthApp,
                  child: const TextCustom(
                    text:
                        'Pep Guardiola reflects on hí toughest Premier League triumph',
                    color: AppColors.black,
                  )),
              const SizedBox(height: AppSize.size20),
              Container(
                  width: AppSize.sizeWidthApp * 0.3,
                  height: AppSize.size1,
                  color: AppColors.red_99.withOpacity(0.3)),
              const SizedBox(height: AppSize.size10),
              Row(
                children: const [
                  TextCustom(
                      text: 'READ MORE',
                      fontSize: AppSize.size13,
                      color: AppColors.red_99,
                      weight: FontFamily.semiBold),
                  SizedBox(width: AppSize.size20),
                  Icon(Icons.arrow_right_alt, size: 20, color: AppColors.red_99)
                ],
              ),
              const SizedBox(height: AppSize.size30),
            ],
          ),
        ),
        const Divider(
          color: AppColors.grey,
        ),
      ],
    );
  }
}
