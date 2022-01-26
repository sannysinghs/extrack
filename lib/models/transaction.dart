import 'package:flutter/foundation.dart';

class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final bool isIncoming;

  Transaction({
    @required this.id,
    @required this.title,
    @required this.amount,
    @required this.date,
    String label,
    this.isIncoming = false,
  });


  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
      id: json['id'],
      title: json['title'],
      amount: json['amount'],
      date: DateTime.now());

  Map<String, dynamic> toJson() => {
    "id" : id,
    "title": title,
    "amount": amount,
    "date": date.toString(),
    "label" : "",
    "isIncoming": false
  };
}