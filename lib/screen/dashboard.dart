import 'package:flutter/material.dart';
import 'package:frezzy_budget/screen/add_transection.dart';
import 'package:frezzy_budget/widgets/balance_card.dart';
import 'package:frezzy_budget/widgets/transaction_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreen();
}

class _DashboardScreen extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Frezzy Budget',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: BalanceCard(balance: 2000),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return TransactionCard();
            }, childCount: 5),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed:
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddtransectionScreen()),
            ),
      ),
    );
  }
}
