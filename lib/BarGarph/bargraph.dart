import 'package:expensetracker/BarGarph/bar_Data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartt extends StatelessWidget {
  const BarChartt({super.key, this.maxY, required this.sunAmount, required this.monAmount, required this.tueAmount, required this.wedAmount, required this.thuAmount, required this.friAmount, required this.satAmount});
  final double? maxY;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thuAmount;
  final double friAmount;
  final double satAmount;
  final double sunAmount;
  
  @override
  Widget build(BuildContext context) {
    BarData myData = BarData(
      monAmount: monAmount,
      sunAmount: sunAmount,
      thuAmount: thuAmount,
      wedAmount: wedAmount,
      tueAmount: tueAmount,
      friAmount: friAmount,
      satAmount: satAmount
    );
    myData.InitializeData();
    return BarChart(
      BarChartData(
        maxY: maxY,
        minY: 0,
        barGroups: myData.badData.map((data) => BarChartGroupData(
          x: data.x,
          barRods: [BarChartRodData(toY: data.y)],
        )).toList()
      ),
    );
  }
}