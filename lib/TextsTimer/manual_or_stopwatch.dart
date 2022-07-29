import 'package:eigo/TextsTimer/record_time_widow.dart';
import 'package:eigo/TextsTimer/timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecordTime extends StatefulWidget {
  const RecordTime({super.key});

  @override
  State<RecordTime> createState() => _RecordTimeState();
}

class _RecordTimeState extends State<RecordTime> {
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

                },
                child: const Text(
                  '記録',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 20,
                  )
                ),
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
                selectedValue = value!;
                setState(() {});
              },
              groupValue: selectedValue,
            ),
          ),
          selectedValue == 0 
          ? SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: const RecordTimeWindow())
          : 
            SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: const TextsTimer())
        ],
      ),
    );
  }
}
