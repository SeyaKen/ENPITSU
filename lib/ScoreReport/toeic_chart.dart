import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';

class TOEICChart extends StatefulWidget {
  const TOEICChart({super.key});

  @override
  State<TOEICChart> createState() => _TOEICChartState();
}

class _TOEICChartState extends State<TOEICChart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff3B00FF),
      appBar: AppBar(
        title: const Text(''),
      ),
      body: AspectRatio(
        aspectRatio: 16 / 9,
        child: DChartLine(
          data: const [
            {
              'id': 'Line',
              'data': [
                {'domain': 0, 'measure': 5},
                {'domain': 2, 'measure': 4},
                {'domain': 3, 'measure': 6},
                {'domain': 4, 'measure': 1},
              ],
              
            },
          ],
          lineWidth: 3.3,
          pointColor: (lineData, index, id) {
            return const Color(0xff3B00FF);
          },
          includePoints: true,
          lineColor: (lineData, index, id) => Colors.white,
        ),
      ),
    );
  }
}
