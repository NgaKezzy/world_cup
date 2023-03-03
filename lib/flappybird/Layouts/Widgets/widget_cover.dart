// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class Cover extends StatelessWidget {
  Cover({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[900],
      alignment: Alignment.center,
      child: Text(
        "FlappyBall",
        style:
            TextStyle(color: Colors.white, fontSize: 45, fontFamily: "Magic4"),
      ),
    );
  }
}
