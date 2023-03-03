import 'package:flutter/material.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';

class TabBarViewWidget extends StatelessWidget {
  List<Tab> tabs;
  var widget;
  Color? color;
  MainAxisAlignment? mainAxisAlignment;
  double? padding = 75;
  TabBarViewWidget(this.tabs, this.widget,
      {Key? key, this.color, this.mainAxisAlignment, this.padding = 75})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Builder(
        builder: (BuildContext context) {
          final TabController tabController = DefaultTabController.of(context)!;
          tabController.addListener(() {
            if (!tabController.indexIsChanging) {}
          });
          return Column(
            children: [
              Container(
                color: color,
                child: TabBar(
                  indicatorColor: AppColors.pink,
                  tabs: tabs.map((Tab tab) {
                    return SizedBox(
                      height: AppSize.size40,
                      child: Center(
                        child: TextCustom(
                          text: tab.text.toString(),
                          fontSize: AppSize.size14,
                          weight: FontFamily.semiBold,
                          color: Colors.white,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Expanded(
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: widget,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
