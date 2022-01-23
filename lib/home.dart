import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_complete_guide/main.dart';
import 'package:flutter_complete_guide/widgets/custom_appbar.dart';
import 'package:flutter_complete_guide/widgets/header_wallet.dart';
import 'package:flutter_complete_guide/widgets/new_transaction.dart';
import 'package:flutter_complete_guide/widgets/transaction_record.dart';

import 'models/transaction.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [];

  void _addNewTransaction(
    String txTitle,
    double txAmount,
    DateTime chosenDate,
  ) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: chosenDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  double _loadTotalBalance() {
    var balance = 0.0;
    _userTransactions.forEach((e) {
      balance += e.amount;
    });
    return balance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate(<Widget>[
            CustomAppBar(),
            WalletBar(totalBalance: _loadTotalBalance()),
          ])),
          SliverList(
              delegate: SliverChildListDelegate(<Widget>[
            Visibility(
              child: _emptyTransactionsView(context),
              visible: _userTransactions.isEmpty,
            )
          ])),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final item = _userTransactions[index];
                return GestureDetector(
                  onTap: () => _deleteTransaction(item.id),
                  child: TransactionRecord(
                    amount: item.amount,
                    date: item.date,
                    note: item.title,
                  ),
                );
              },
              childCount: _userTransactions.length,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.lightBlue,
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
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
