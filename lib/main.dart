import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:expense_tracker/Provider/transaction_provider.dart';
import 'package:expense_tracker/Screens/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TransactionProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: home_screen(),
    );
  }
}