import 'package:flutter/material.dart';
import 'package:worldcup_app/config_app/config_app.dart';

class Logo extends StatelessWidget {
  final String? path;
  final double? height;
  const Logo(
      {Key? key,
      this.path = 'assets/images/logo_new.png',
      this.height = AppSize.size40})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path!,
      height: height!,
    );
  }
}
