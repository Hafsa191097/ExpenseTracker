
import 'package:expensetracker/Data/Expense_Data.dart';
import 'package:expensetracker/Models/expense_item.dart';
import 'package:expensetracker/components/expense_summary.dart';
import 'package:expensetracker/components/listTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpenseTrackerPage extends StatefulWidget {
  const ExpenseTrackerPage({super.key});

  @override
  State<ExpenseTrackerPage> createState() => _ExpenseTrackerPageState();
}

class _ExpenseTrackerPageState extends State<ExpenseTrackerPage> {
  
  final newExpenseAmountController = TextEditingController();
  final newExpenseNameController = TextEditingController();
  void addExpense(){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add New Expense'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: newExpenseNameController,
            ),
            TextField(
              controller: newExpenseAmountController,
            ),
          ],
        ),
        actions: [
          MaterialButton(
            onPressed: SaveData,
            child: Text('Save'),
          ), 
          MaterialButton(
            onPressed: Cancel,
            child:const Text('Cancel'),
          ),
        ],
      ),
      
    );
  }
  // ignore: non_constant_identifier_names
  void Cancel(){
    Navigator.pop(context);
    Clear();
  }
  void SaveData(){
    ExpenseItem item = ExpenseItem(
      Name: newExpenseNameController.text,
      Amount: newExpenseAmountController.text, 
      dateTime: DateTime.now());
    Provider.of<ExpenseData>(context,listen: false).addExpense(item);
    Navigator.pop(context);
    Clear();
  }

  void Clear(){
    newExpenseNameController.clear();
    newExpenseAmountController.clear();
  }
  
  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
      builder: (context,value,child) => Scaffold(
       backgroundColor: Colors.grey[300],
       
       floatingActionButton: FloatingActionButton(
        onPressed: addExpense,
        child:const Icon(Icons.add),
          
      ),
      body: ListView(
        children: [
          const SizedBox(height:20),
          ExpenseSummary(statofweek: value.dateStartOfWeek()),
            ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: value.getExpense().length,
              itemBuilder: (context, index) =>
              MyWidget(name: value.getExpense()[index].Name,
              amount: value.getExpense()[index].Amount,
              dateTime: value.getExpense()[index].dateTime
            ),
          ),
        ],
      ),
      
     ), 
      
    );
  }
}