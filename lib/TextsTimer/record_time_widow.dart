import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecordTimeWindow extends StatefulWidget {
  const RecordTimeWindow({super.key});

  @override
  State<RecordTimeWindow> createState() => _RecordTimeWindowState();
}

class _RecordTimeWindowState extends State<RecordTimeWindow> {
  int? hour;

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
            height: 216,
            padding: const EdgeInsets.only(top: 0.0),
            // The Bottom margin is provided to align the popup above the system navigation bar.
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            color: CupertinoColors.systemBackground.resolveFrom(context),
            child: Column(
              children: [
                CupertinoTimerPicker(
                  mode: CupertinoTimerPickerMode.hm,
                  onTimerDurationChanged: (value) {
                    print(value.toString().length);
                    print(
                        'hour:${value.toString().length == 14 ? value.toString().substring(0, 1) : value.toString().substring(0, 2)}');
                    print('minutes:${value.toString().length == 14 ? value.toString().substring(2, 4) : value.toString().substring(3, 5)}');
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
                // こんな画像のアドレスは存在しない.
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
            child: Text('$hour'),
          )
        ],
      ),
    );
  }
}
