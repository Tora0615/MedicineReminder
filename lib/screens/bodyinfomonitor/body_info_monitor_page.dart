import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:ui' as ui;

class BodyInfo extends StatefulWidget {
  const BodyInfo({Key key}) : super(key: key);

  @override
  State<BodyInfo> createState() => _BodyInfoState();
}

class _BodyInfoState extends State<BodyInfo> {
  List<_TempData> tempdata = [
    _TempData('9:00', 35.4),
    _TempData('10:00', 35.5),
    _TempData('11:00', 35.8),
    _TempData('12:00', 35.7),
    _TempData('13:00', 36.1),
    _TempData('14:00', 36.0),
    _TempData('15:00', 35.8),
    _TempData('16:00', 35.5)
  ];

  List<_TempData> sugardata = [
    _TempData('9:00', 132),
    _TempData('10:00', 125),
    _TempData('11:00', 130),
    _TempData('12:00', 126),
    _TempData('13:00', 120),
    _TempData('14:00', 121),
    _TempData('15:00', 112),
    _TempData('16:00', 114)
  ];

  List<_TempData> pressuredata = [
    _TempData('11/23', 107),
    _TempData('11/24', 112),
    _TempData('11/25', 119),
    _TempData('11/26', 118),
    _TempData('11/27', 122),
    _TempData('11/28', 118),
    _TempData('11/29', 121),
    _TempData('11/30', 120)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OOO 長輩身體數值及用藥紀錄'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.indigo[900],
      ),
      body: ListView(
        children: [
          //Initialize the chart widget
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                  color: Colors.orangeAccent[100],
                ),
                width: 75,
                height: 75,
                child: Center(
                  child: Text("早上:\n已服藥 "),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                  color: Colors.orangeAccent[100],
                ),
                width: 75,
                height: 75,
                child: Center(
                  child: Text("中午:\n已服藥 "),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                  color: Colors.orangeAccent[100],
                ),
                width: 75,
                height: 75,
                child: Center(
                  child: Text("晚上:\n未服藥 "),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                  color: Colors.orangeAccent[100],
                ),
                width: 75,
                height: 75,
                child: Center(
                  child: Text("睡前:\n時間未到 "),
                ),
              ),
            ],
          ),
          SizedBox(height: 15,),
          Container(
            child: SfCartesianChart(
              backgroundColor: Colors.grey[100],
              primaryXAxis: CategoryAxis(),
              // Y 軸 range
              primaryYAxis: NumericAxis(minimum: 34, maximum: 37),
              // Chart title
              title: ChartTitle(text: '體溫'),
              // Enable legend (圖例)
              legend: Legend(isVisible: false),
              // Enable tooltip (點擊的提示)
              tooltipBehavior: TooltipBehavior(enable: false),
              series: <ChartSeries<_TempData, String>>[
                LineSeries<_TempData, String>(
                  dataSource: tempdata,
                  xValueMapper: (_TempData data, _) => data.year,
                  yValueMapper: (_TempData data, _) => data.sales,
                  name: 'Sales',
                  // Enable data label (線上標籤)
                  dataLabelSettings: DataLabelSettings(isVisible: true),

                  //似乎舊版本不能用
                  // onCreateShader: (ShaderDetails details) {
                  //   return ui.Gradient.linear(
                  //       details.rect.topRight,
                  //       details.rect.bottomLeft,
                  //       <Color>[Colors.yellow, Colors.lightBlue, Colors.brown],
                  //       <double>[0.2,0.6,1]
                  //   );
                  // },
                ),
              ],
            ),
          ),
          SizedBox(height: 15,),
          SfCartesianChart(
            backgroundColor: Colors.grey[100],
            primaryXAxis: CategoryAxis(),
            // Y 軸 range
            primaryYAxis: NumericAxis(minimum: 100, maximum: 140),
            // Chart title
            title: ChartTitle(text: '血糖'),
            // Enable legend (圖例)
            legend: Legend(isVisible: false),
            // Enable tooltip (點擊的提示)
            tooltipBehavior: TooltipBehavior(enable: false),
            series: <ChartSeries<_TempData, String>>[
              LineSeries<_TempData, String>(
                dataSource: sugardata,
                xValueMapper: (_TempData data, _) => data.year,
                yValueMapper: (_TempData data, _) => data.sales,
                name: 'Sales',
                // Enable data label (線上標籤)
                dataLabelSettings: DataLabelSettings(isVisible: true),

                //似乎舊版本不能用
                // onCreateShader: (ShaderDetails details) {
                //   return ui.Gradient.linear(
                //       details.rect.topRight,
                //       details.rect.bottomLeft,
                //       <Color>[Colors.yellow, Colors.lightBlue, Colors.brown],
                //       <double>[0.2,0.6,1]
                //   );
                // },
              ),
            ],
          ),
          SizedBox(height: 15,),
          SfCartesianChart(
            backgroundColor: Colors.grey[100],
            primaryXAxis: CategoryAxis(),
            // Y 軸 range
            primaryYAxis: NumericAxis(minimum: 100, maximum: 140),
            // Chart title
            title: ChartTitle(text: '血壓'),
            // Enable legend (圖例)
            legend: Legend(isVisible: false),
            // Enable tooltip (點擊的提示)
            tooltipBehavior: TooltipBehavior(enable: false),
            series: <ChartSeries<_TempData, String>>[
              LineSeries<_TempData, String>(
                dataSource: pressuredata,
                xValueMapper: (_TempData data, _) => data.year,
                yValueMapper: (_TempData data, _) => data.sales,
                name: 'Sales',
                // Enable data label (線上標籤)
                dataLabelSettings: DataLabelSettings(isVisible: true),

                //似乎舊版本不能用
                // onCreateShader: (ShaderDetails details) {
                //   return ui.Gradient.linear(
                //       details.rect.topRight,
                //       details.rect.bottomLeft,
                //       <Color>[Colors.yellow, Colors.lightBlue, Colors.brown],
                //       <double>[0.2,0.6,1]
                //   );
                // },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TempData {
  _TempData(this.year, this.sales);

  final String year;
  final double sales;
}
