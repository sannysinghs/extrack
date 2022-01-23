import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final String label;
  final Function deleteTx;

  TransactionList(this.transactions, this.label, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? _emptyTransactionsView(context)
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("${transactions[index].amount}"),
              );
            },
          );
  }

  Column _emptyTransactionsView(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'No transactions added yet!',
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(
          height: 20,
        ),
        Container(
            height: 200,
            child: Image.asset(
              'assets/images/waiting.png',
              fit: BoxFit.cover,
            )),
      ],
    );
  }
}
