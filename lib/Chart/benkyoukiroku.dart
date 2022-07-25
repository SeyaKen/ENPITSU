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

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}

class _BenkyouKirokuState extends State<BenkyouKiroku> {
  late DateTime date;
  BannerAd? banner;

  List<charts.Series<dynamic, String>> getData() {
    final desktopSalesData = [
      OrdinalSales(
          DateTime(date.year, date.month, date.day - 6)
              .toString()
              .substring(6, 10)
              .replaceAll('-', '/'),
          5),
      OrdinalSales(
          DateTime(date.year, date.month, date.day - 5)
              .toString()
              .substring(6, 10)
              .replaceAll('-', '/'),
          14),
      OrdinalSales(
          DateTime(date.year, date.month, date.day - 4)
              .toString()
              .substring(6, 10)
              .replaceAll('-', '/'),
          14),
      OrdinalSales(
          DateTime(date.year, date.month, date.day - 3)
              .toString()
              .substring(6, 10)
              .replaceAll('-', '/'),
          14),
      OrdinalSales(
          DateTime(date.year, date.month, date.day - 2)
              .toString()
              .substring(6, 10)
              .replaceAll('-', '/'),
          10),
      OrdinalSales(
          DateTime(date.year, date.month, date.day - 1)
              .toString()
              .substring(6, 10)
              .replaceAll('-', '/'),
          10),
      OrdinalSales(
          DateTime(date.year, date.month, date.day)
              .toString()
              .substring(6, 10)
              .replaceAll('-', '/'),
          10),
    ];

    final tableSalesData = [
      OrdinalSales(
          DateTime(date.year, date.month, date.day - 6)
              .toString()
              .substring(6, 10)
              .replaceAll('-', '/'),
          5),
      OrdinalSales(
          DateTime(date.year, date.month, date.day - 5)
              .toString()
              .substring(6, 10)
              .replaceAll('-', '/'),
          14),
      OrdinalSales(
          DateTime(date.year, date.month, date.day - 4)
              .toString()
              .substring(6, 10)
              .replaceAll('-', '/'),
          14),
      OrdinalSales(
          DateTime(date.year, date.month, date.day - 3)
              .toString()
              .substring(6, 10)
              .replaceAll('-', '/'),
          14),
      OrdinalSales(
          DateTime(date.year, date.month, date.day - 2)
              .toString()
              .substring(6, 10)
              .replaceAll('-', '/'),
          10),
      OrdinalSales(
          DateTime(date.year, date.month, date.day - 1)
              .toString()
              .substring(6, 10)
              .replaceAll('-', '/'),
          10),
      OrdinalSales(
          DateTime(date.year, date.month, date.day)
              .toString()
              .substring(6, 10)
              .replaceAll('-', '/'),
          10),
    ];

    final mobileSalesData = [
      OrdinalSales(
          DateTime(date.year, date.month, date.day - 6)
              .toString()
              .substring(6, 10)
              .replaceAll('-', '/'),
          5),
      OrdinalSales(
          DateTime(date.year, date.month, date.day - 5)
              .toString()
              .substring(6, 10)
              .replaceAll('-', '/'),
          14),
      OrdinalSales(
          DateTime(date.year, date.month, date.day - 4)
              .toString()
              .substring(6, 10)
              .replaceAll('-', '/'),
          14),
      OrdinalSales(
          DateTime(date.year, date.month, date.day - 3)
              .toString()
              .substring(6, 10)
              .replaceAll('-', '/'),
          14),
      OrdinalSales(
          DateTime(date.year, date.month, date.day - 2)
              .toString()
              .substring(6, 10)
              .replaceAll('-', '/'),
          10),
      OrdinalSales(
          DateTime(date.year, date.month, date.day - 1)
              .toString()
              .substring(6, 10)
              .replaceAll('-', '/'),
          10),
      OrdinalSales(
          DateTime(date.year, date.month, date.day)
              .toString()
              .substring(6, 10)
              .replaceAll('-', '/'),
          0),
    ];

    return [
      charts.Series<OrdinalSales, String>(
        id: 'Desktop',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: desktopSalesData,
      ),
      charts.Series<OrdinalSales, String>(
        id: 'Tablet',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: tableSalesData,
      ),
      charts.Series<OrdinalSales, String>(
        id: 'Mobile',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: mobileSalesData,
      ),
    ];
  }

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
                          getData(),
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
