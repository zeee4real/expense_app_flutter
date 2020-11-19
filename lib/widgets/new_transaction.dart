import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addNewItem;

  NewTransaction(this.addNewItem);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              controller: amountController,
            ),
            FlatButton(
              onPressed: () {
                addNewItem(
                    titleController.text, double.parse(amountController.text));
              },
              color: Colors.purple,
              textColor: Colors.white,
              child: Text('Add Transaction'),
            )
          ],
        ),
      ),
    );
  }
}
