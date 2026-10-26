import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/Model/transaction_model.dart';

class TransactionProvider with ChangeNotifier {
  final List<TransactionModel> _transactions = [];
  List<TransactionModel> get transaction => _transactions;

  //calculate the total income
double get totalIncome => _transactions
    .where((tx) => tx.isIncome)
    .fold(0,(sum,tx) => sum + tx.amount);


// calculate the total expence
  double get totalExpence => _transactions
    .where((tx) => !tx.isIncome)
    .fold(0,(sum,tx)=> sum+tx.amount);

  // remaining balance
  double get remainingBalance => totalIncome - totalExpence;

//method to add an new transaction
void addTransaction (String title, double amount , bool isIncome) {
  final newTransaction = TransactionModel(
      id: DateTime.now().toString(),
      date: DateTime.now(),
      title: title,
      amount: amount,
      isIncome: isIncome,
  );

  //transaction
  _transactions.insert(0, newTransaction);
notifyListeners();
}

//method to remove
  void removeTransaction (String id){
    _transactions.removeWhere((tx)=> tx.id == id);
    notifyListeners();
  }
}