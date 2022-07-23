import 'package:eigo/ScoreReport/toeic_chart.dart';
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
    setState(() {});
    super.initState();
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
                Icons.show_chart_rounded ,
                size: 30,
              ),
              label: 'スコアレポート',
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
          TOEICChart(),
          ProfilePage(),
        ],
      ),
    );
  }
}
