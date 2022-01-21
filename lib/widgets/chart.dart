import 'package:flutter/material.dart';
import 'package:tp2/models/transaction.dart';

import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTreansactions;

  Chart(this.recentTreansactions);

  List<Map<String, Object>> get groupedTramsactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;
      for (var i = 0; i < recentTreansactions.length; i++) {
        if (recentTreansactions[i].date.day == weekDay.day &&
            recentTreansactions[i].date.month == weekDay.month &&
            recentTreansactions[i].date.year == weekDay.year) {
          totalSum += recentTreansactions[i].amount;
        }
      }

      print(DateFormat.E(weekDay));
      print(totalSum);

      return {
        'day': DateFormat.E(weekDay),
        'amount': totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: [],
      ),
    );
  }
}
