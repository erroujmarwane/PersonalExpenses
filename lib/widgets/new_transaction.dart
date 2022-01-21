import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitDate() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse( amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
        return;
    } 
    widget.addTx(
      enteredTitle,
      enteredAmount,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitDate(),
              // onChanged: (value) {
              //   titleInput =value;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              // onChanged: (value)=> amountINput = value,
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitDate(),
            ),
            TextButton.icon(
              icon: Icon(
                Icons.add,
                size: 18,
                color: Colors.purple,
              ),
              onPressed: submitDate,
              label: Text(
                'Add Transaction',
                style: TextStyle(
                  color: Colors.purple,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
