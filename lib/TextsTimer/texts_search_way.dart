import 'package:flutter/material.dart';

class TextSearchWay extends StatefulWidget {
  const TextSearchWay({super.key});

  @override
  State<TextSearchWay> createState() => _TextSearchWayState();
}

class _TextSearchWayState extends State<TextSearchWay> {
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
                '教材を探す',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.black,
                ),
              ),
              const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 30,
                color: Colors.transparent,
              ),
            ],
          )),
    );
  }
}
