import 'dart:async';

import 'package:flutter/material.dart';

class TextsTimer extends StatefulWidget {
  const TextsTimer({super.key});

  @override
  State<TextsTimer> createState() => _TextsTimerState();
}

class _TextsTimerState extends State<TextsTimer> {
  Duration duration = const Duration();
  Timer? timer;
  bool GoonTimer = false;

  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Text('$minutes:$seconds', style: const TextStyle(fontSize: 80));
  }

  void addTime() {
    const addSeconds = 1;

    setState(() {
      final seconds = duration.inSeconds + addSeconds;

      duration = Duration(seconds: seconds);
    });
  }

  void reset() {
    setState(() {
      duration = const Duration();
    });
  }

  void startTimer() {
    setState(() {
    GoonTimer = true;
    });
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
  }

  void stopTimer() {
    setState(() {
      GoonTimer = false;
      timer?.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildTime(),
          const SizedBox(height: 50),
          InkWell(
            onTap: () {
              // タイマーが進んでいたら、止まる処理、
              // タイマーが止まっていたら、進む処理
              GoonTimer ? stopTimer() : startTimer();
            },
            child: Container(
              padding: const EdgeInsets.all(5.0),
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(1000),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
