import 'dart:math';

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());
// アロー関数は 1行のメソッドの時に使用する

//void main() {
//  runApp(
//    XylophoneApp()
//  );
//}

class XylophoneApp extends StatelessWidget {
  void playSound(int soundNumber) {
    final player = AudioCache();
    player.play('note$soundNumber.wav');
  }

  Expanded buildKey(Color c, int soundNumber) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: FlatButton(
              color: c,
              onPressed: () {
                playSound(soundNumber);
              },
            ),
          ),
          Expanded(
            child: FlatButton(
              child: Text('I\'m random sound'),
              color: Colors.white,
              onPressed: () {
                playSound(Random().nextInt(7) + 1);
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.stretch, // これで限界まで伸ばす。 stretch !!!!!
            children: <Widget>[
              buildKey(Colors.red, 1),
              buildKey(Colors.orange, 2),
              buildKey(Colors.yellow, 3),
              buildKey(Colors.green, 4),
              buildKey(Colors.greenAccent, 5),
              buildKey(Colors.blue, 6),
              buildKey(Colors.purple, 7),
            ],
          ),
        ),
      ),
    );
  }
}
