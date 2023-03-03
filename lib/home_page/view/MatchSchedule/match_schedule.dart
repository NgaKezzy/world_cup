import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/home_page/view/MatchSchedule/widgets/item_listview_day.dart';
import 'package:worldcup_app/home_page/view/MatchSchedule/widgets/item_match_schdule.dart';

class MatchSchedule extends StatelessWidget {
  const MatchSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        child: SafeArea(
      child: Column(
        children: [
          HeaderBase(
            text: 'Match Schdule',
            onTap: () => Get.back(),
          ),
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                height: AppSize.size45,
                width: AppSize.sizeWidthApp * 0.8,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ItemListviewDay(day: 'Hôm nay', dayMonth: '26 tháng 9'),
                    ItemListviewDay(day: 'Hôm nay', dayMonth: '26 tháng 9'),
                    ItemListviewDay(day: 'Hôm nay', dayMonth: '26 tháng 9'),
                    ItemListviewDay(day: 'Hôm nay', dayMonth: '26 tháng 9'),
                    ItemListviewDay(day: 'Hôm nay', dayMonth: '26 tháng 9'),
                  ],
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    // click và mở lịch lên
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: const Icon(Icons.calendar_month,
                        color: AppColors.white, size: AppSize.size30),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20, width: AppSize.sizeWidthApp),
          Container(
            height: AppSize.sizeHeightApp - 239,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                width: AppSize.sizeWidthApp,
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSize.size10, vertical: AppSize.size15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            TextCustom(text: 'Nations League'),
                            TextCustom(text: 'Châu Âu')
                          ],
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Icon(Icons.arrow_forward_ios,
                              color: AppColors.white, size: AppSize.size20),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: AppSize.size10,
                    ),
                    Column(
                      children: const [
                        ItemMatchSchdule(),
                        ItemMatchSchdule(),
                        ItemMatchSchdule(),
                        ItemMatchSchdule(),
                        ItemMatchSchdule(),
                        ItemMatchSchdule(),
                        ItemMatchSchdule(),
                        ItemMatchSchdule(),
                        ItemMatchSchdule(),
                      ],
                    ),
                    const SizedBox(height: AppSize.size10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            TextCustom(text: 'Giao Hữu'),
                            TextCustom(text: 'Quốc Tế')
                          ],
                        ),
                        const Icon(Icons.arrow_forward_ios,
                            color: AppColors.white, size: AppSize.size20)
                      ],
                    ),
                    const SizedBox(
                      height: AppSize.size10,
                    ),
                    Column(
                      children: const [
                        ItemMatchSchdule(),
                        ItemMatchSchdule(),
                        ItemMatchSchdule(),
                        ItemMatchSchdule(),
                        ItemMatchSchdule(),
                        ItemMatchSchdule(),
                        ItemMatchSchdule(),
                        ItemMatchSchdule(),
                        ItemMatchSchdule(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
