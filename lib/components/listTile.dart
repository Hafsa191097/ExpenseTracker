

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyWidget extends StatelessWidget {
   MyWidget({super.key, required this.name,required this.amount, required this.dateTime});
  String name,amount;
  DateTime dateTime;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      subtitle: Text('${dateTime.day} / ${dateTime.month} / ${dateTime.year}'),
      trailing: Text('\$$amount'),
    );
  }
}  