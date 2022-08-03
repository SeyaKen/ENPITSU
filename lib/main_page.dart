import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eigo/Chart/benkyoukiroku.dart';
import 'package:eigo/TextsTimer/texts_lists.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:eigo/Home/home_screen.dart';
import 'package:eigo/profile/profile_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key, required this.currenttab}) : super(key: key);

  int currenttab;

  @override
  _MainPageState createState() => _MainPageState(currenttab);
}

class _MainPageState extends State<MainPage> {
  int currenttab;
  _MainPageState(this.currenttab);
  String? myUserUid;

  getMyUserUid() async {
    myUserUid = FirebaseAuth.instance.currentUser!.uid;
    setState(() {});
  }

  onScreenLoaded() async {
    await getMyUserUid();
    setState(() {});
  }

  @override
  void initState() {
    onScreenLoaded();
    print(DateTime.now().hour);
    DateTime.now().hour == 0 && DateTime.now().hour == 0
        ? FirebaseFirestore.instance
            .collection('users')
            .doc(myUserUid)
            .collection('BenkyouJikan')
            .doc()
            .set({
            'date': DateTime(DateTime.now().year, DateTime.now().month,
                    DateTime.now().day)
                .toString()
                .substring(0, 10),
            'Kyouzai': [],
          })
        : null;
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              currenttab = index;
            });
          },
          currentIndex: currenttab,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.grey,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              label: 'ホーム',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_box_outlined,
                size: 33,
              ),
              label: '記録する',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.bar_chart_outlined,
                size: 40,
              ),
              label: 'レポート',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                size: 30,
              ),
              label: 'プロフィール',
            ),
          ]),
      body: IndexedStack(
        index: currenttab,
        children: const [
          HomeScreen(),
          TextList(),
          BenkyouKiroku(),
          ProfilePage(),
        ],
      ),
    );
  }
}
