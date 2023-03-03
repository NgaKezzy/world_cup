import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:worldcup_app/config_app/app_size.dart';

// ignore: must_be_immutable
class ItemWeb extends StatelessWidget {
  ItemWeb({super.key, required this.img});
  String img;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.size50,
      width: AppSize.size50,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(
        'assets/svg/' + img,
        height: 50,
        width: 50,
      ),
    );
  }
}
