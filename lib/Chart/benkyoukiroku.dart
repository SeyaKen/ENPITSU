import 'package:flutter/material.dart';
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
  final List<String> entries = <String>['韓国語', 'プログラミング', '英語'];
  final List<Color> colorCodes = [
    const Color(0xff7ba734),
    const Color(0xffc09014),
    const Color(0xff0064aa)
  ];

  _generateData() {
    final pieData = [
      Task('プログラミング', 40, colorCodes[0]),
      Task('英語', 13, colorCodes[1]),
      Task('韓国語', 40, colorCodes[2]),
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
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const  [
                    Text('レポート',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 22,
                        )),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
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
                    padding: const EdgeInsets.symmetric(horizontal: 20),
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
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: const [
                        Text('時間配分(今日)',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 114, 112, 112),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.40,
                          child: Stack(
                            children: [
                              charts.PieChart<String>(
                                _seriesPieData!,
                                animate: false,
                                layoutConfig: charts.LayoutConfig(
                                  leftMarginSpec:
                                      charts.MarginSpec.fixedPixel(0),
                                  topMarginSpec:
                                      charts.MarginSpec.fixedPixel(0),
                                  rightMarginSpec:
                                      charts.MarginSpec.fixedPixel(0),
                                  bottomMarginSpec:
                                      charts.MarginSpec.fixedPixel(0),
                                ),
                                defaultRenderer: charts.ArcRendererConfig(
                                  arcWidth: 10,
                                ),
                              ),
                              const Align(
                                // 赤のコンテナだけを右下に配置する
                                alignment: Alignment.center,
                                child: Text('10.3h'),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: ListView.builder(
                              itemCount: entries.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Row(
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      size: 11,
                                      color: colorCodes[index],
                                    ),
                                    const SizedBox(width: 5),
                                    Text(entries[index]),
                                  ],
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: const [
                        Text('時間配分(週)',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 114, 112, 112),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.40,
                          child: Stack(
                            children: [
                              charts.PieChart<String>(
                                _seriesPieData!,
                                animate: false,
                                layoutConfig: charts.LayoutConfig(
                                  leftMarginSpec:
                                      charts.MarginSpec.fixedPixel(0),
                                  topMarginSpec:
                                      charts.MarginSpec.fixedPixel(0),
                                  rightMarginSpec:
                                      charts.MarginSpec.fixedPixel(0),
                                  bottomMarginSpec:
                                      charts.MarginSpec.fixedPixel(0),
                                ),
                                defaultRenderer: charts.ArcRendererConfig(
                                    arcWidth: 10000,
                                    arcRendererDecorators: [
                                      charts.ArcLabelDecorator(
                                          labelPosition:
                                              charts.ArcLabelPosition.inside)
                                    ]),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: ListView.builder(
                              itemCount: entries.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Row(
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      size: 11,
                                      color: colorCodes[index],
                                    ),
                                    const SizedBox(width: 5),
                                    Text(entries[index]),
                                  ],
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ]),
      )),
    );
  }
}
