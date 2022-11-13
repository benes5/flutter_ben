import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

const data_count = 10;
List<double> datalist = [30, 26, 25];

class MyChatrApp extends StatelessWidget {
  const MyChatrApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LineChartSample(),
    );
  }
}

class LineChartSample extends StatefulWidget {
  const LineChartSample({Key? key}) : super(key: key);

  @override
  State<LineChartSample> createState() => _LineChartSampleState();
}

class _LineChartSampleState extends State<LineChartSample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LineCharts'),
      ),
      body: LineChart(

        // 折線グラフ
        LineChartData(
          // 折れ線グラフデータ
          // read about it in the LineChartData section
            maxX: datalist.length.toDouble(), // x 軸の最大 x を取得します。null の場合、値は入力 lineBars から読み取られます
            maxY: datalist.reduce(max), // y 軸の最大 y を取得します。null の場合、値は入力 lineBars から読み取られます
            minX: 0, // x 軸の最小 x を取得します。null の場合、値は入力 lineBars から読み取られます
            minY: datalist.reduce(min), // y 軸の最小 y を取得します。null の場合、値は入力 lineBars から読み取られます

            lineBarsData: [
              // 線を表示するためのデータ
              LineChartBarData(
                // この中に線の色やサイズを書く!
                  isCurved: false,
                  barWidth: 3.0, // 線の幅
                  color: Colors.green[300], // 線の色
                  spots: [
                    FlSpot(0, 0), // 左が横で、右が高さの数値
                    FlSpot(1, 2),
                    FlSpot(2, 8),
                    FlSpot(3, 4),
                    FlSpot(4, 2),
                    FlSpot(5, 6),
                    FlSpot(6, 0),
                    FlSpot(7, 8),
                    FlSpot(8, 5),


                  ])
            ]),
        swapAnimationDuration: Duration(milliseconds: 150),
        swapAnimationCurve: Curves.linear,
      ),
    );
  }
}
