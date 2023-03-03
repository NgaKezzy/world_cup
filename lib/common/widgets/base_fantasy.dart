import 'package:flutter/material.dart';
import 'package:worldcup_app/config_app/config_app.dart';

class BaseFantasy extends StatelessWidget {
  final Widget child;
  const BaseFantasy({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: AppSize.sizeWidthApp,
        height: AppSize.sizeHeightApp,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 4, 163, 236),
              Color.fromARGB(255, 97, 71, 158),
            ],
          ),
        ),
        child: child,
      ),
    );
  }
}
