// ignore_for_file: prefer_const_constructors, unnecessary_import, unused_local_variable
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audioplayers_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Global/Constant/constant.dart';
import '../Layouts/Pages/page_start_screen.dart';

class GameMainFlappy extends StatefulWidget {
  const GameMainFlappy({Key? key}) : super(key: key);

  @override
  State<GameMainFlappy> createState() => _GameMainFlappyState();
}

class _GameMainFlappyState extends State<GameMainFlappy> {
  @override
  void initState() {
    super.initState();

    setAudio();

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.PLAYING;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });

    if (isPlaying == false) {
      audioPlayer.resume();
    }
  }

  Future setAudio() async {
    audioPlayer.setReleaseMode(ReleaseMode.LOOP);
    final player = AudioCache(prefix: 'assets/audio/');
    final url = await player.load('backgroundAudio.mp3');
    audioPlayer.setUrl(url.path, isLocal: true);
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return StartScreen();
  }
}
