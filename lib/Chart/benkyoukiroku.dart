import 'package:eigo/ad_state.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class BenkyouKiroku extends StatefulWidget {
  const BenkyouKiroku({super.key});

  @override
  State<BenkyouKiroku> createState() => _BenkyouKirokuState();
}

class _BenkyouKirokuState extends State<BenkyouKiroku> {
  late DateTime date;
  BannerAd? banner;
  final List<charts.Series<dynamic, String>> seriesList = [
    
  ];

  @override
  void initState() {
    date = DateTime.now();
    final adState = Provider.of<AdState>(context, listen: false);
    adState.initialization.then((status) {
      setState(() {
        banner = BannerAd(
          adUnitId: adState.bannerAdUnitId,
          size: AdSize.banner,
          request: const AdRequest(),
          listener: const BannerAdListener(),
        )..load();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('レポート',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              )),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      children: const [
                        Text('学習時間',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 114, 112, 112),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: charts.BarChart(
                          seriesList,
                          animate: false,
                          barGroupingType: charts.BarGroupingType.stacked,
                        )),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      children: const [
                        Text('時間配分',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 114, 112, 112),
                            )),
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.20,
                        width: MediaQuery.of(context).size.height * 0.20,
                        // child:
                      )
                    ],
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: banner != null
                          ? AdWidget(
                              ad: banner!,
                            )
                          : const SizedBox()),
                ],
              ),
            ]));
  }
}
