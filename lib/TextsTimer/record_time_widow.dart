import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecordTimeWindow extends StatefulWidget {
  const RecordTimeWindow({super.key});

  @override
  State<RecordTimeWindow> createState() => _RecordTimeWindowState();
}

class _RecordTimeWindowState extends State<RecordTimeWindow> {
  int _selectedFruit = 0;

  // This shows a CupertinoModalPopup with a reasonable fixed height which hosts CupertinoPicker.
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
            // Provide a background color for the popup.
            color: CupertinoColors.systemBackground.resolveFrom(context),
            // Use a SafeArea widget to avoid system overlaps.
            child: Column(
              children: [
                CupertinoTimerPicker(
                  
                  mode: CupertinoTimerPickerMode.hm,
                  onTimerDurationChanged: (value) {
                    
                  },
                ),
              ],
            )));
  }

  double _kItemExtent = 32.0;
  List<String> _fruitNames = <String>[
    'Apple',
    'Mango',
    'Banana',
    'Orange',
    'Pineapple',
    'Strawberry',
  ];

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
            // Display a CupertinoPicker with list of fruits.
            onPressed: () => _showDialog(
              CupertinoPicker(
                magnification: 1.22,
                squeeze: 1.2,
                useMagnifier: true,
                itemExtent: _kItemExtent,
                // This is called when selected item is changed.
                onSelectedItemChanged: (int selectedItem) {
                  setState(() {
                    _selectedFruit = selectedItem;
                  });
                },
                children:
                    List<Widget>.generate(_fruitNames.length, (int index) {
                  return Center(
                    child: Text(
                      _fruitNames[index],
                    ),
                  );
                }),
              ),
            ),
            // This displays the selected fruit name.
            child: Text(
              _fruitNames[_selectedFruit],
              style: const TextStyle(
                fontSize: 22.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
