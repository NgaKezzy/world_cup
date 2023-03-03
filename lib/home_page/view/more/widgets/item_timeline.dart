import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';

class ItemTimeline extends StatelessWidget {
  const ItemTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: 20,
            width: 20,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                color: AppColors.pink, shape: BoxShape.circle),
            child: Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                    color: Colors.purple.shade900, shape: BoxShape.circle))),
        Container(
          height: 420,
          width: 5,
          color: AppColors.pink,
        ),
        Container(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 150,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/man-city-vo-dich-ngoai-hang-anh-202122-085007630.jpg')))),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(height: 15),
                      TextCustom(
                          text: 'Sat 12 Sep, Liverpool 4-3 Leeds',
                          fontSize: AppSize.size18,
                          color: AppColors.white,
                          weight: FontFamily.semiBold),
                      SizedBox(height: 15),
                      TextCustom(
                        text:
                            'Leeds United announced themselves in the Premier League in style with a thrilling contest against reigning champions Liverpool on the opening weekend, narrowly losing 4-3 late on at Anfield.',
                      )
                    ]),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
