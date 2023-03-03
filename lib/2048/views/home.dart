import 'package:flutter/material.dart';
import 'package:worldcup_app/2048/utils/colors.dart';
import 'package:worldcup_app/2048/views/board_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: const SafeArea(
        child: Center(
          child: BoardScreen(),
        ),
      ),
    );
  }
}
