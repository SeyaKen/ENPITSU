import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eigo/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecordTime extends StatefulWidget {
  const RecordTime({super.key});

  @override
  State<RecordTime> createState() => _RecordTimeState();
}

class _RecordTimeState extends State<RecordTime> {
  String uid = FirebaseAuth.instance.currentUser!.uid;

  int selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 30,
                  color: Colors.black,
                ),
              ),
              const Text(
                '勉強時間を記録',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              InkWell(
                onTap: () {
                  FirebaseFirestore.instance
                      .collection('users')
                      .doc(uid)
                      .collection('BenkyouJikan')
                      .doc(DateTime.now().toString().substring(0, 10))
                      .set({
                    'ターゲット1900': time,
                  });
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => MainPage(currenttab: 0,),
                        transitionDuration: const Duration(seconds: 0),
                      ));
                },
                child: const Text('記録',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 20,
                    )),
              ),
            ],
          )),
      body: Column(
        children: [
          const SizedBox(height: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: CupertinoSlidingSegmentedControl(
              children: const {
                0: Text("記録する"),
                1: Text("ストップウォッチ"),
              },
              onValueChanged: (value) {
                setState(() {
                  selectedValue = value!;
                });
              },
              groupValue: selectedValue,
            ),
          ),
          selectedValue == 0
              ? SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: const RecordTimeWindow())
              : SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: const TextsTimer())
        ],
      ),
    );
  }
}

// 手動で記録するWindow
String time = '0:00:00.000000';

class RecordTimeWindow extends StatefulWidget {
  const RecordTimeWindow({super.key});

  @override
  State<RecordTimeWindow> createState() => _RecordTimeWindowState();
}

class _RecordTimeWindowState extends State<RecordTimeWindow> {
  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
            height: 216,
            padding: const EdgeInsets.only(top: 0.0),
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            color: CupertinoColors.systemBackground.resolveFrom(context),
            child: Column(
              children: [
                CupertinoTimerPicker(
                  mode: CupertinoTimerPickerMode.hm,
                  onTimerDurationChanged: (value) {
                    setState(() {
                      time =
                          '${value.toString().length == 14 ? value.toString().substring(0, 1) : value.toString().substring(0, 2)}時間${value.toString().length == 14 ? value.toString().substring(2, 4) : value.toString().substring(3, 5)}分';
                    });
                  },
                ),
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.5,
            width: MediaQuery.of(context).size.width * 0.5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'https://images-na.ssl-images-amazon.com/images/I/417gMKTA1pL._SX312_BO1,204,203,200_.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () => _showDialog(
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.black,
              ),
            ),
            child: Text(
              '${time.toString().length == 14 ? time.toString().substring(0, 1) : time.toString().substring(0, 2)}時間${time.toString().length == 14 ? time.toString().substring(2, 4) : time.toString().substring(3, 5)}分',
              style: const TextStyle(
                fontSize: 35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextsTimer extends StatefulWidget {
  const TextsTimer({super.key});

  @override
  State<TextsTimer> createState() => _TextsTimerState();
}

// タイマーで記録するWindow
class _TextsTimerState extends State<TextsTimer> {
  Duration duration = const Duration();
  Timer? timer;
  bool GoonTimer = false;
  String minutes = '00';
  String seconds = '00';

  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    minutes = twoDigits(duration.inMinutes.remainder(60));
    seconds = twoDigits(duration.inSeconds.remainder(60));

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

  String? val;

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
                        color: GoonTimer ? Colors.red : Colors.blue,
                      ),
                      borderRadius: BorderRadius.circular(1000),
                    ),
                    child: Center(
                      child: Text(GoonTimer ? 'ストップ' : 'スタート',
                          style: TextStyle(
                            color: GoonTimer ? Colors.red : Colors.blue,
                            fontSize: 20,
                          )),
                    ),
                  ),
                ),
                isZero
                    ? InkWell(
                        onTap: () {
                          val = int.parse(minutes) < 60
                              ? '0:${minutes}:00.000000'
                              : int.parse(minutes) >= 600
                                  // 10時間以上の場合
                                  ? '${(int.parse(minutes) / 60).floor()}:${(int.parse(minutes) - 60 * (int.parse(minutes) / 60).floor()) < 10 ? '0${int.parse(minutes) - 60 * (int.parse(minutes) / 60).floor()}' : (int.parse(minutes) - 60 * (int.parse(minutes) / 60).floor()).toString()}:00.000000'
                                  // 10時間未満の場合
                                  : '0${(int.parse(minutes) / 60).floor()}:${(int.parse(minutes) - 60 * (int.parse(minutes) / 60).floor()) < 10 ? '0${int.parse(minutes) - 60 * (int.parse(minutes) / 60).floor()}' : (int.parse(minutes) - 60 * (int.parse(minutes) / 60).floor()).toString()}:00.000000';
                          time =
                              '${val.toString().length == 14 ? val.toString().substring(0, 1) : val.toString().substring(0, 2)}時間${val.toString().length == 14 ? val.toString().substring(2, 4) : val.toString().substring(3, 5)}分';
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
