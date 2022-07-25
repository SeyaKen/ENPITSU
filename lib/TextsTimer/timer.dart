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
    // final isZero = timer == null ? false : timer!.isActive;
    // タイマーがまだ始まっていないのか、もう一回押されたのかを確認するための処理
    final isZero = duration.inSeconds != 0;
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildTime(),
          const SizedBox(height: 50),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                isZero
                    ? InkWell(
                        onTap: () {
                          reset();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5.0),
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(1000),
                          ),
                          child: const Center(
                            child: Text('リセット',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                )),
                          ),
                        ),
                      )
                    : const SizedBox(),
                InkWell(
                  onTap: () {
                    // タイマーが進んでいたら、止まる処理、
                    // タイマーが止まっていたら、進む処理
                    GoonTimer ? stopTimer() : startTimer();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: GoonTimer ? Colors.red : const Color(0xff3B00FF),
                      ),
                      borderRadius: BorderRadius.circular(1000),
                    ),
                    child: Center(
                      child: Text(GoonTimer ? 'ストップ' : 'スタート',
                          style: TextStyle(
                            color:
                                GoonTimer ? Colors.red : const Color(0xff3B00FF),
                            fontSize: 20,
                          )),
                    ),
                  ),
                ),
                isZero
                    ? InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(5.0),
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(1000),
                          ),
                          child: const Center(
                            child: Text('完了',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                )),
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
