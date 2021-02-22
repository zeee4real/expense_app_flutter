import 'package:expense_app_flutter/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required Transaction userTransaction,
    @required Function deleteTx,
  })  : _userTransaction = userTransaction,
        _deleteTx = deleteTx,
        super(key: key);

  final Transaction _userTransaction;
  final Function _deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
              padding: const EdgeInsets.all(6),
              child: FittedBox(child: Text('\$${_userTransaction.amount}'))),
        ),
        title: Text(
          _userTransaction.title,
          style: Theme.of(context).textTheme.headline5,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(_userTransaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? FlatButton.icon(
                onPressed: () => _deleteTx(_userTransaction.id),
                icon: const Icon(
                  Icons.delete,
                ),
                textColor: Theme.of(context).errorColor,
                label: const Text('Delete'))
            : IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => _deleteTx(_userTransaction.id),
              ),
      ),
    );
  }
}
