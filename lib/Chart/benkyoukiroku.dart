import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';

class BenkyouKiroku extends StatefulWidget {
  const BenkyouKiroku({super.key});

  @override
  State<BenkyouKiroku> createState() => _BenkyouKirokuState();
}

class _BenkyouKirokuState extends State<BenkyouKiroku> {
  late DateTime date;

  @override
  void initState() {
    date = DateTime.now();
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
              child: DChartBar(
                data: [
                  {
                    'id': 'Bar',
                    'data': [
                      {
                        'domain': DateTime(date.year, date.month, date.day - 6)
                            .toString()
                            .substring(6, 10)
                            .replaceAll('-', '/'),
                        'measure': 19
                      },
                      {
                        'domain': DateTime(date.year, date.month, date.day - 5)
                            .toString()
                            .substring(6, 10)
                            .replaceAll('-', '/'),
                        'measure': 4
                      },
                      {
                        'domain': DateTime(date.year, date.month, date.day - 4)
                            .toString()
                            .substring(6, 10)
                            .replaceAll('-', '/'),
                        'measure': 6
                      },
                      {
                        'domain': DateTime(date.year, date.month, date.day - 3)
                            .toString()
                            .substring(6, 10)
                            .replaceAll('-', '/'),
                        'measure': 0.3
                      },
                      {
                        'domain': DateTime(date.year, date.month, date.day - 2)
                            .toString()
                            .substring(6, 10)
                            .replaceAll('-', '/'),
                        'measure': 3
                      },
                      {
                        'domain': DateTime(date.year, date.month, date.day - 1)
                            .toString()
                            .substring(6, 10)
                            .replaceAll('-', '/'),
                        'measure': 4
                      },
                      {
                        'domain': DateTime.now()
                            .toString()
                            .substring(6, 10)
                            .replaceAll('-', '/'),
                        'measure': 0.3
                      },
                    ],
                  },
                ],
                barValue: (barData, index) => '${barData['measure']}h',
                showBarValue: true,
                barValuePosition: BarValuePosition.outside,
                domainLabelPaddingToAxisLine: 16,
                axisLineTick: 2,
                axisLinePointTick: 2,
                axisLinePointWidth: 10,
                axisLineColor: const Color(0xff3B00FF),
                measureLabelPaddingToAxisLine: 16,
                barColor: (barData, index, id) => const Color(0xff3B00FF),
              ),
            ),
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
                child: DChartPie(
                  data: const [
                    {'domain': 'Flutter 60%', 'measure': 28},
                    {'domain': 'React Native', 'measure': 27},
                    {'domain': 'Ionic', 'measure': 20},
                    {'domain': 'Cordova', 'measure': 15},
                  ],
                  fillColor: (pieData, index) {
                    switch (pieData['domain']) {
                      case 'Flutter 60%':
                        return Colors.green;
                      case 'React Native':
                        return Colors.orange;
                      case 'Ionic':
                        return Colors.blue;
                      default:
                        return Colors.red;
                    }
                  },
                  labelColor: Colors.white,
                  labelPadding: 0,
                  showLabelLine: false,
                ),
              ),
              Column(
                children: [
                  const SizedBox(height: 20),
                  Row(
                    children: const [
                      Icon(
                        Icons.circle,
                        size: 12,
                      ),
                      Text(
                        'プログラミング',
                        style: TextStyle(
                          fontSize: 12,
                        )
                      ),
                    ],
                  ),
                  SizedBox(height: 3),
                  Row(
                    children: const [
                      Icon(
                        Icons.circle,
                        size: 12,
                      ),
                      Text(
                        'プログラミング',
                        style: TextStyle(
                          fontSize: 12,
                        )
                      ),
                    ],
                  ),
                  SizedBox(height: 3),
                  Row(
                    children: const [
                      Icon(
                        Icons.circle,
                        size: 12,
                      ),
                      Text(
                        'プログラミング',
                        style: TextStyle(
                          fontSize: 12,
                        )
                      ),
                    ],
                  ),
                  SizedBox(height: 3),
                  Row(
                    children: const [
                      Icon(
                        Icons.circle,
                        size: 12,
                      ),
                      Text(
                        'プログラミング',
                        style: TextStyle(
                          fontSize: 12,
                        )
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
