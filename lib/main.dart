import 'package:eigo/ad_state.dart';
import 'package:eigo/updater.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:eigo/SplashScreen/splash_screen.dart';
import 'package:eigo/services/google_sign_in.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final initFuture = MobileAds.instance.initialize();
  final adState = AdState(initFuture);
  runApp(
    Provider.value(
      value: adState,
      builder: (context, child) => const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('English'), Locale('ja')],
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
