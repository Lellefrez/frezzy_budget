import 'package:flutter/material.dart';
import 'package:frezzy_budget/providers/transaction_provider.dart';
import 'package:frezzy_budget/screen/dashboard.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => TransactionProvider())],
      child: MaterialApp(
        title: 'Frezzay Budget',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
        home: const DashboardScreen(),
      ),
    );
  }
}
