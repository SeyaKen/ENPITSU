import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdState {
  Future<InitializationStatus> initialization;

  AdState(this.initialization);

  String get bannerAdUnitId => Platform.isAndroid
  ? 'ca-app-pub-2820998332028532/2664245992'
  : 'ca-app-pub-2820998332028532/2809933268';
}
