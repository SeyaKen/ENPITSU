import 'package:eigo/ad_state.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;

// 棒グラフのデータ
class BarData {
  final String year;
  final int sales;

  BarData(this.year, this.sales);
}

// 円グラフのデータ
class Task {
  String task;
  double taskvalue;
  Color colorval;

  Task(this.task, this.taskvalue, this.colorval);
}

class BenkyouKiroku extends StatefulWidget {
  const BenkyouKiroku({super.key});

  @override
  State<BenkyouKiroku> createState() => _BenkyouKirokuState();
}

class _BenkyouKirokuState extends State<BenkyouKiroku> {
  late DateTime date;

  List<charts.Series<Task, String>>? _seriesPieData;

  _generateData() {
    final pieData = [
      Task('プログラミング', 40, Colors.blue),
      Task('英語', 13, Colors.orange),
      Task('韓国語', 40, Colors.red),
    ];

    _seriesPieData!.add(
      charts.Series(
        data: pieData,
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.taskvalue,
        colorFn: (Task task, _) =>
            charts.ColorUtil.fromDartColor(task.colorval),
        id: 'Daily Task',
        labelAccessorFn: (Task row, _) => '${row.taskvalue}',
      ),
    );
  }

  List<charts.Series<dynamic, String>> getData() {
    final desktopSalesData = [
      BarData(
          DateTime(date.year, date.month, date.day - 6)
              .toString()
              .substring(6, 10)
              .replaceAll('-', '/'),
          5),
      BarData(
          DateTime(date.year, date.month, date.day - 5)
              .toString()
              .substring(6, 10)
              .replaceAll('-', '/'),
          14),
      BarData(
          DateTime(date.year, date.month, date.day - 4)
              .toString()
              .substring(6, 10)
              .replaceAll('-', '/'),
          14),
      BarData(
          DateTime(date.year, date.month, date.day - 3)
              .toString()
              .substring(6, 10)
              .replaceAll('-', '/'),
          14),
      BarData(
          DateTime(date.year, date.month, date.day - 2)
              .toString()
              .substring(6, 10)
              .replaceAll('-', '/'),
          10),
      BarData(
          DateTime(date.year, date.month, date.day - 1)
              .toString()
              .substring(6, 10)
              .replaceAll('-', '/'),
          10),
      BarData(
          DateTime(date.year, date.month, date.day)
              .toString()
              .substring(6, 10)
              .replaceAll('-', '/'),
          10),
    ];

    final tableSalesData = [
      BarData(
          DateTime(date.year, date.month, date.day - 6)
              .toString()
              .substring(6, 10)
              .replaceAll('-', '/'),
          5),
      BarData(
          DateTime(date.year, date.month, date.day - 5)
              .toString()
              .substring(6, 10)
              .replaceAll('-', '/'),
          14),
      BarData(
          DateTime(date.year, date.month, date.day - 4)
              .toString()
              .substring(6, 10)
              .replaceAll('-', '/'),
          14),
      BarData(
          DateTime(date.year, date.month, date.day - 3)
              .toString()
              .substring(6, 10)
              .replaceAll('-', '/'),
          14),
      BarData(
          DateTime(date.year, date.month, date.day - 2)
              .toString()
              .substring(6, 10)
              .replaceAll('-', '/'),
          10),
      BarData(
          DateTime(date.year, date.month, date.day - 1)
              .toString()
              .substring(6, 10)
              .replaceAll('-', '/'),
          10),
      BarData(
          DateTime(date.year, date.month, date.day)
              .toString()
              .substring(6, 10)
              .replaceAll('-', '/'),
          10),
    ];

    final mobileSalesData = [
      BarData(
          DateTime(date.year, date.month, date.day - 6)
              .toString()
              .substring(6, 10)
              .replaceAll('-', '/'),
          5),
      BarData(
          DateTime(date.year, date.month, date.day - 5)
              .toString()
              .substring(6, 10)
              .replaceAll('-', '/'),
          14),
      BarData(
          DateTime(date.year, date.month, date.day - 4)
              .toString()
              .substring(6, 10)
              .replaceAll('-', '/'),
          14),
      BarData(
          DateTime(date.year, date.month, date.day - 3)
              .toString()
              .substring(6, 10)
              .replaceAll('-', '/'),
          14),
      BarData(
          DateTime(date.year, date.month, date.day - 2)
              .toString()
              .substring(6, 10)
              .replaceAll('-', '/'),
          10),
      BarData(
          DateTime(date.year, date.month, date.day - 1)
              .toString()
              .substring(6, 10)
              .replaceAll('-', '/'),
          10),
      BarData(
          DateTime(date.year, date.month, date.day)
              .toString()
              .substring(6, 10)
              .replaceAll('-', '/'),
          0),
    ];

    return [
      charts.Series<BarData, String>(
        id: 'プログラミング',
        domainFn: (BarData sales, _) => sales.year,
        measureFn: (BarData sales, _) => sales.sales,
        data: desktopSalesData,
      ),
      charts.Series<BarData, String>(
        id: '英語',
        domainFn: (BarData sales, _) => sales.year,
        measureFn: (BarData sales, _) => sales.sales,
        data: tableSalesData,
      ),
      charts.Series<BarData, String>(
        id: '韓国語',
        domainFn: (BarData sales, _) => sales.year,
        measureFn: (BarData sales, _) => sales.sales,
        data: mobileSalesData,
      ),
    ];
  }

  @override
  void initState() {
    date = DateTime.now();
    _seriesPieData = <charts.Series<Task, String>>[];
    _generateData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              )),
        ),
        body: SingleChildScrollView(
          child: Column(
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
                          Text(
                            '時間配分(今日)',
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
                          height: MediaQuery.of(context).size.height * 0.30,
                          width: MediaQuery.of(context).size.width,
                          child: charts.PieChart<String>(
                            _seriesPieData!,
                            animate: false,
                            behaviors: [
                              charts.DatumLegend(
                                  outsideJustification:
                                      charts.OutsideJustification.endDrawArea,
                                  horizontalFirst: false,
                                  desiredMaxRows: 10,
                                  cellPadding: const EdgeInsets.all(0),
                                  entryTextStyle: const charts.TextStyleSpec(
                                    color: charts.MaterialPalette.black,
                                    fontSize: 11,
                                  ))
                            ],
                            defaultRenderer: charts.ArcRendererConfig(
                                arcWidth: 100000,
                                arcRendererDecorators: [
                                  charts.ArcLabelDecorator(
                                      labelPosition:
                                          charts.ArcLabelPosition.inside)
                                ]),
                          ),
                        )
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        children: const [
                          Text(
                            '時間配分(週)',
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
                          height: MediaQuery.of(context).size.height * 0.30,
                          width: MediaQuery.of(context).size.width,
                          child: charts.PieChart<String>(
                            _seriesPieData!,
                            animate: false,
                            behaviors: [
                              charts.DatumLegend(
                                  outsideJustification:
                                      charts.OutsideJustification.endDrawArea,
                                  horizontalFirst: false,
                                  desiredMaxRows: 10,
                                  cellPadding: const EdgeInsets.all(0),
                                  entryTextStyle: const charts.TextStyleSpec(
                                    color: charts.MaterialPalette.black,
                                    fontSize: 11,
                                  ))
                            ],
                            defaultRenderer: charts.ArcRendererConfig(
                                arcWidth: 100000,
                                arcRendererDecorators: [
                                  charts.ArcLabelDecorator(
                                      labelPosition:
                                          charts.ArcLabelPosition.inside)
                                ]),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ]),
        ));
  }
}
