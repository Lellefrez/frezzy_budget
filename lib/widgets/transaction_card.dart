import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({super.key});

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.currency(symbol: '€', decimalDigits: 0);

    return Card(
      color: Colors.white,
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(Icons.restaurant),
        ),
        title: Text(
          "Ristorante",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
        ),
        subtitle: Text(
          "14/07/2025",
          style: TextStyle(color: Colors.grey[600], fontSize: 14),
        ),
        trailing: Text(formatter.format(50), style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
