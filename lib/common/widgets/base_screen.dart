import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:worldcup_app/config_app/config_app.dart';
import 'package:worldcup_app/services/storage/local_storage_service.dart';

class BaseScreen extends StatelessWidget {
  final Widget child;
  final bool withScaffold;
  final Widget? bottomNavigationBar;
  final double padding;
  final Color? color;
  final String backgroundPath;
  const BaseScreen({
    Key? key,
    required this.child,
    this.bottomNavigationBar,
    this.padding = 0.0,
    this.color,
    this.withScaffold = true,
    this.backgroundPath = 'assets/images/bg_purple.png',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return withScaffold
        ? Scaffold(
            resizeToAvoidBottomInset: false,
            body: _buildStack(context),
            bottomNavigationBar: bottomNavigationBar,
          )
        : child;
  }

  Widget _buildStack(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: AppSize.sizeWidthApp,
          height: AppSize.sizeHeightApp,
          child: Image.asset(
            backgroundPath,
            fit: BoxFit.cover,
          ),
        ),
        // if ((LocalStorageService().getString('enableSnow') ?? '1') == '1')
        //   Positioned(
        //     height: bottomNavigationBar != null
        //         ? AppSize.sizeHeightApp - AppSize.size3
        //         : AppSize.sizeHeightApp,
        //     child: Column(
        //       children: [
        //         Expanded(
        //           child: LottieBuilder.asset(
        //             'assets/lottie/snowfalling.json',
        //             fit: BoxFit.cover,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        SizedBox(
          width: AppSize.sizeWidthApp,
          height: bottomNavigationBar != null
              ? AppSize.sizeHeightApp - AppSize.size3
              : AppSize.sizeHeightApp,
          child: bottomNavigationBar != null
              ? Column(
                  children: [
                    Expanded(
                      child: child,
                    ),
                    Container(
                      width: Get.width,
                      color: Colors.white,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: padding),
                            height: AppSize.size3,
                            width: Get.width / 6,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [AppColors.red, AppColors.purple],
                              ),
                            ),
                          ),
                          Spacer()
                        ],
                      ),
                    )
                  ],
                )
              : child,
        ),
      ],
    );
  }
}
