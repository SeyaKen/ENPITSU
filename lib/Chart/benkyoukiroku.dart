import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  String uid = FirebaseAuth.instance.currentUser!.uid;
  Stream<QuerySnapshot<Object?>>? dataStateStream;
  List<charts.Series<Task, String>>? _seriesPieData;
  String? today;
  final List<String> entries = <String>['韓国語', 'プログラミング', '英語'];
  final List<Color> colorCodes = [
    const Color(0xff7ba734),
    const Color(0xffc09014),
    const Color(0xff0064aa),
  ];

  getBenkyouJikan() async {
    dataStateStream = FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('BenkyouJikan')
        .snapshots();
    setState(() {});
  }

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

  List<charts.Series<dynamic, String>> getData(List textsData) {
    List<BarData> desktopSalesData;
    desktopSalesData = [
      BarData(
          DateTime(date.year, date.month, date.day - 6)
              .toString()
              .substring(6, 10)
              .replaceAll('-', '/'),
          textsData[textsData.length - 7]['Kyouzai'].length != 0
              ? int.parse(textsData[textsData.length - 1]
                          [textsData[textsData.length - 7]['Kyouzai'][0]][0]) *
                      60 +
                  int.parse(textsData[textsData.length - 1]
                      [textsData[textsData.length - 7]['Kyouzai'][0]][1])
              : 0),
      BarData(
          DateTime(date.year, date.month, date.day - 5)
              .toString()
              .substring(6, 10)
              .replaceAll('-', '/'),
          textsData[textsData.length - 6]['Kyouzai'].length != 0
              ? int.parse(textsData[textsData.length - 1]
                          [textsData[textsData.length - 6]['Kyouzai'][0]][0]) *
                      60 +
                  int.parse(textsData[textsData.length - 1]
                      [textsData[textsData.length - 6]['Kyouzai'][0]][1])
              : 0),
      BarData(
          DateTime(date.year, date.month, date.day - 4)
              .toString()
              .substring(6, 10)
              .replaceAll('-', '/'),
          textsData[textsData.length - 5]['Kyouzai'].length != 0
              ? int.parse(textsData[textsData.length - 1]
                          [textsData[textsData.length - 5]['Kyouzai'][0]][0]) *
                      60 +
                  int.parse(textsData[textsData.length - 1]
                      [textsData[textsData.length - 5]['Kyouzai'][0]][1])
              : 0),
      BarData(
          DateTime(date.year, date.month, date.day - 3)
              .toString()
              .substring(6, 10)
              .replaceAll('-', '/'),
          textsData[textsData.length - 4]['Kyouzai'].length != 0
              ? int.parse(textsData[textsData.length - 1]
                          [textsData[textsData.length - 4]['Kyouzai'][0]][0]) *
                      60 +
                  int.parse(textsData[textsData.length - 1]
                      [textsData[textsData.length - 4]['Kyouzai'][0]][1])
              : 0),
      BarData(
          DateTime(date.year, date.month, date.day - 2)
              .toString()
              .substring(6, 10)
              .replaceAll('-', '/'),
          textsData[textsData.length - 3]['Kyouzai'].length != 0
              ? int.parse(textsData[textsData.length - 1]
                          [textsData[textsData.length - 3]['Kyouzai'][0]][0]) *
                      60 +
                  int.parse(textsData[textsData.length - 1]
                      [textsData[textsData.length - 3]['Kyouzai'][0]][1])
              : 0),
      BarData(
          DateTime(date.year, date.month, date.day - 1)
              .toString()
              .substring(6, 10)
              .replaceAll('-', '/'),
          textsData[textsData.length - 2]['Kyouzai'].length != 0
              ? int.parse(textsData[textsData.length - 1]
                          [textsData[textsData.length - 2]['Kyouzai'][0]][0]) *
                      60 +
                  int.parse(textsData[textsData.length - 1]
                      [textsData[textsData.length - 2]['Kyouzai'][0]][1])
              : 0),
      BarData(
          DateTime(date.year, date.month, date.day)
              .toString()
              .substring(6, 10)
              .replaceAll('-', '/'),
          textsData[textsData.length - 1]['Kyouzai'].length != 0
              ? int.parse(textsData[textsData.length - 1]
                          [textsData[textsData.length - 1]['Kyouzai'][0]][0]) *
                      60 +
                  int.parse(textsData[textsData.length - 1]
                      [textsData[textsData.length - 1]['Kyouzai'][0]][1])
              : 0),
    ];

    return [
      charts.Series<BarData, String>(
        id: 'プログラミング',
        domainFn: (BarData sales, _) => sales.year,
        measureFn: (BarData sales, _) => sales.sales,
        data: desktopSalesData,
      ),
    ];
  }

  @override
  void initState() {
    date = DateTime.now();
    today =
        DateTime(date.year, date.month, date.day).toString().substring(0, 10);
    getBenkyouJikan();
    _seriesPieData = <charts.Series<Task, String>>[];
    _generateData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            titleSpacing: 0,
            title: const Text('レポート',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: const [
                            Text('学習時間(分)',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 114, 112, 112),
                                )),
                          ],
                        ),
                        AspectRatio(
                            aspectRatio: 16 / 9,
                            child: StreamBuilder(
                                stream: dataStateStream,
                                builder: (context, snapshot) {
                                  // if (snapshot.hasData) {
                                  //   print(snapshot.data!.docs[0]['Kyouzai']);
                                  //   print('かきくけこ');
                                  // }
                                  return snapshot.hasData
                                      ? charts.BarChart(
                                          getData(snapshot.data!.docs),
                                          animate: false,
                                          barGroupingType:
                                              charts.BarGroupingType.stacked,
                                        )
                                      : const Center(
                                          child: CircularProgressIndicator());
                                })),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: const [
                            Text('時間配分(今日)',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 114, 112, 112),
                                )),
                          ],
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
                                    itemBuilder:
                                        (BuildContext context, int index) {
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
                        Row(
                          children: const [
                            Text('時間配分(週)',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 114, 112, 112),
                                )),
                          ],
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
                                                labelPosition: charts
                                                    .ArcLabelPosition.inside)
                                          ]),
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                child: ListView.builder(
                                    itemCount: entries.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
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
            ),
          )),
    );
  }
}
