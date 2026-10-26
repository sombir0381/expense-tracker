import 'package:expense_tracker/widgets/add_transaction.dart';
import 'package:expense_tracker/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/remaining_balance.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text("Expense Tracker"),
     ),
      body: Column(
        children: [
          RemainingBalance(),
          Expanded(child: TransactionList())
        ],
      ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          setState(() {
            showModalBottomSheet(context: context,builder:(_)=> add_transaction());
          });
        },
          child: Icon(Icons.add),
        )
    );
  }
}
