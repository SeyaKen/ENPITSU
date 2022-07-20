import 'package:eigo/updater.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:eigo/SplashScreen/splash_screen.dart';
import 'package:eigo/services/google_sign_in.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final initFuture = MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: Stack(children: [
          const MySplashScreen(),
          Updater(
            appStoreUrl: 'AppストアのURL',
            playStoreUrl: 'PlayストアのURL',
          ),
        ]),
      ),
    );
  }
}
