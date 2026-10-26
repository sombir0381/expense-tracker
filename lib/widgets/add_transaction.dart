import 'package:expense_tracker/Provider/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:expense_tracker/widgets/transaction_list.dart';
class add_transaction extends StatefulWidget {
  const add_transaction({super.key});

  @override
  State<add_transaction> createState() => _add_transactionState();
}

class _add_transactionState extends State<add_transaction> {

  final _amountController = TextEditingController();
  final _titleController = TextEditingController();
  bool isIncome = true;

  void submitData (){
    final title = _titleController.text;
    final amount = double.tryParse(_amountController.text) ?? 0;

    if (title.isEmpty || amount <= 0)return;
    Provider.of<TransactionProvider>(context, listen: false)
        .addTransaction(title, amount, isIncome);
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsetsGeometry.all(15),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(labelText: "Title"),
          ),
          TextField(
            controller: _amountController,
            decoration: InputDecoration(labelText: "amount"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Switch(value: isIncome, onChanged: (val){
                setState(() {
                  isIncome = val;
                });
              }),
              Text("Income",style: TextStyle(color: isIncome==true ? Colors.green: Colors.black),),
              Text("Expense",style: TextStyle(color: isIncome==false ? Colors.red : Colors.black),)
            ],
          ),
          ElevatedButton(onPressed: submitData,
              child: Text("Add Transaction"))
        ],
      ),
    );

  }
}
