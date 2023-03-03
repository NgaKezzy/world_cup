import 'package:flutter/material.dart';
import 'package:worldcup_app/2048/views/home.dart';

void main() {
  runApp(const Game2048());
}

class Game2048 extends StatelessWidget {
  const Game2048({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Home();
  }
}
