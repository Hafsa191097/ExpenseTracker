
import 'package:expensetracker/Data/Expense_Data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../BarGarph/bargraph.dart';
import '../Date_Time/date_time.dart';

class ExpenseSummary extends StatelessWidget {
  const ExpenseSummary({super.key, required this.statofweek});
  final DateTime statofweek;
  @override
  Widget build(BuildContext context) {
    String sunday = ConverDateTime(statofweek.add(const Duration(days: 0)));
    String monday = ConverDateTime(statofweek.add(const Duration(days: 1)));
    String tuesday = ConverDateTime(statofweek.add(const Duration(days: 2)));
    String wednesday = ConverDateTime(statofweek.add(const Duration(days: 3)));
    String thursday = ConverDateTime(statofweek.add(const Duration(days: 4)));
    String friday = ConverDateTime(statofweek.add(const Duration(days: 5)));
    String saturday = ConverDateTime(statofweek.add(const Duration(days: 6)));
    
    return Consumer<ExpenseData>(
      builder: (context,value,child) => SizedBox(
        height: 200,
        child: BarChartt(
          maxY: 200,
          monAmount: 67,
          sunAmount: 80,
          thuAmount: 2,
          wedAmount: 1,
          tueAmount: 40,
          friAmount: 32,
          satAmount: 100,
        ),
      ),
      
    );
  }
}