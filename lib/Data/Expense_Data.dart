

import 'package:flutter/material.dart';

import '../Date_Time/date_time.dart';
import '../Models/expense_item.dart';

class ExpenseData extends ChangeNotifier{
  List<ExpenseItem> expenseData  =[];
  List<ExpenseItem> getExpense(){
    return expenseData;
  }
  void addExpense(ExpenseItem item){
    expenseData.add(item);
    notifyListeners();
  }
  void deleteExpense(ExpenseItem item){
    expenseData.remove(item);
    notifyListeners();
  }
  String getDayName(DateTime day){
    switch (day.weekday) {
      case 0:
        return 'Sun';
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thur';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      default:
        return '1';
    }
  }

  DateTime dateStartOfWeek(){
    DateTime startofweek = DateTime(2023);
    DateTime today = DateTime.now();
    for (var i = 0; i < 7; i++) {
      if(getDayName(today.subtract(Duration(days: i))) == 'Sun'){
        startofweek = today.subtract(Duration(days: i));
      }
    }
    return startofweek;
  }

  Map<String, double> calculateExpenseSummary(){
    Map<String, double> dailyExpenseSummary={

    };
    for (var expense in expenseData) {
      String date= ConverDateTime(expense.dateTime);
      double amount = double.parse(expense.Amount);
      if(dailyExpenseSummary.containsKey(date)){
        double currentAmount = dailyExpenseSummary[date]!;
        dailyExpenseSummary[date] = currentAmount;
      }else{
        dailyExpenseSummary.addAll({date : amount});
      }
    }
    return dailyExpenseSummary;
  }

}