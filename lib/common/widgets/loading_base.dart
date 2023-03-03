import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_size.dart';

class LoadingBase extends StatelessWidget {
  final Color color;
  const LoadingBase({super.key, this.color = AppColors.white});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitCubeGrid(
        color: color,
        size: AppSize.size35,
      ),
    );
  }
}
