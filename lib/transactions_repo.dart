
import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import 'models/transaction.dart';

abstract class TransactionsRepo {
  Future<List<Transaction>> loadTransactions();
  void saveTransactions(List<Transaction> trans);
}

class SharedPrefTransactionsRepo extends TransactionsRepo {

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File("$path/transactions.json");
  }

  @override
  Future<List<Transaction>> loadTransactions() async {
    try {
      final file = await _localFile;
      final String content = await file.readAsString();
      final decode = json.decode(content);

      final List<Transaction> trans = [];
      decode.forEach((element) {
        trans.add(Transaction.fromJson(element));
      });

      return trans;
    } catch (e) {
      return List.empty();
    }
  }

  @override
  void saveTransactions(List<Transaction> trans) async {
      final file = await  _localFile;
      file.writeAsString(jsonEncode(trans));
  }
}