// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, avoid_unnecessary_containers, avoid_print

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:worldcup_app/flappybird/Database/database.dart';
import 'package:worldcup_app/flappybird/Layouts/Pages/page_start_screen.dart';
import 'package:worldcup_app/flappybird/Layouts/Widgets/widget_barrier.dart';
import 'package:worldcup_app/flappybird/Layouts/Widgets/widget_bird.dart';
import 'package:worldcup_app/flappybird/Layouts/Widgets/widget_cover.dart';

import '../../Global/Constant/constant.dart';
import '../../Global/Function/functions.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    try {
      TOP_SCORE = read(1);
    } catch (error) {
      print('$error');
    }
    return GestureDetector(
      onTap: gameHasStarted ? jump : startGame,
      child: Scaffold(
        body: Column(children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: background(im),
              child: Stack(
                children: [
                  Bird(yAxis, birdWidth, birdHeight),
                  // Tap to play text
                  Container(
                    alignment: Alignment(0, -0.3),
                    child: myText(
                        gameHasStarted ? '' : 'TAP TO START', Colors.white, 25),
                  ),
                  Barrier(barrierHeight[0][0], barrierWidth, barrierX[0], true),
                  Barrier(
                      barrierHeight[0][1], barrierWidth, barrierX[0], false),
                  Barrier(barrierHeight[1][0], barrierWidth, barrierX[1], true),
                  Barrier(
                      barrierHeight[1][1], barrierWidth, barrierX[1], false),
                  Positioned(
                    bottom: 1,
                    right: 1,
                    left: 1,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Score : $SCORE",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontFamily: "Magic4"),
                          ), // Best TEXT
                          Text("Best : $TOP_SCORE",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontFamily: "Magic4")),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Cover(),
          ),
        ]),
      ),
    );
  }

  // Jump Function:
  void jump() {
    setState(() {
      time = 0;
      initialHeight = yAxis;
    });
  }

  //Start Game Function:
  void startGame() {
    gameHasStarted = true;
    Timer.periodic(Duration(milliseconds: 35), (timer) {
      height = gravity * time * time + velocity * time;
      setState(() {
        yAxis = initialHeight - height;
      });
      /* <  Barriers Movements  > */
      setState(() {
        if (barrierX[0] < screenEnd) {
          barrierX[0] += screenStart;
        } else {
          barrierX[0] -= barrierMovement;
        }
      });
      setState(() {
        if (barrierX[1] < screenEnd) {
          barrierX[1] += screenStart;
        } else {
          barrierX[1] -= barrierMovement;
        }
      });
      if (birdIsDead()) {
        timer.cancel();
        _showDialog();
      }
      time += 0.032;
    });
    /* <  Calculate Score  > */
    Timer.periodic(Duration(seconds: 2), (timer) {
      if (birdIsDead()) {
        timer.cancel();
        SCORE = 0;
      } else {
        setState(() {
          if (SCORE == TOP_SCORE) {
            TOP_SCORE++;
            // TODO: add the Top score to Database
            write(1, TOP_SCORE);
          }
          SCORE++;
          // print("Score : $SCORE, Best: $TOP_SCORE");
        });
      }
    });
  }

  /// Make sure the [Bird] doesn't go out screen & hit the barrier
  bool birdIsDead() {
    // Screen
    if (yAxis > 1.26 || yAxis < -1.1) {
      return true;
    }

    /// Barrier hitBox
    for (int i = 0; i < barrierX.length; i++) {
      if (barrierX[i] <= birdWidth &&
          (barrierX[i] + (barrierWidth)) >= birdWidth &&
          (yAxis <= -1 + barrierHeight[i][0] ||
              yAxis + birdHeight >= 1 - barrierHeight[i][1])) {
        return true;
      }
    }
    return false;
  }

  void resetGame() {
    Navigator.pop(context); // dismisses the alert dialog
    setState(() {
      yAxis = 0;
      gameHasStarted = false;
      time = 0;
      SCORE = 0;
      initialHeight = yAxis;
      barrierX[0] = 2;
      barrierX[1] = 3.4;
    });
  }

  // TODO: Alert Dialog with 2 options (try again, exit)
  void _showDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          title: myText("..Oops", Colors.red[900], 35),
          actionsPadding: EdgeInsets.only(right: 8, bottom: 8),
          content: Container(
            child: Lottie.asset("assets/pics/loss.json", fit: BoxFit.cover),
          ),
          actions: [
            gameButton(() {
              resetGame();
              Get.to(() => StartScreen());
            }, "Exit", Colors.grey),
            gameButton(() {
              resetGame();
            }, "try again", Colors.green),
          ],
        );
      },
    );
  }
}
