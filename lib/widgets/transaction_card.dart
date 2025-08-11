import 'package:flutter/material.dart';
import 'package:frezzy_budget/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;

  const TransactionCard({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.currency(symbol: '€', decimalDigits: 0);
    final dateFormatter = DateFormat('yyyy-MM-dd');

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
          child: Icon(getIconForCategory(transaction.category)),
        ),
        title: Text(
          transaction.category,
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
        ),
        subtitle: Text(
          dateFormatter.format(transaction.date),
          style: TextStyle(color: Colors.grey[600], fontSize: 14),
        ),
        trailing: Text(
          '${transaction.isIncome ? "+" : "-"} ${formatter.format(transaction.amount)}',
          style: TextStyle(
            fontSize: 18,
            color: transaction.isIncome ? Colors.green : Colors.red,
          ),
        ),
      ),
    );
  }
}

IconData getIconForCategory(String category) {
  switch (category.toLowerCase()) {
    case 'salary':
      return Icons.attach_money;
    case 'food & dining':
    case 'restaurant':
      return Icons.restaurant;
    case 'transportation':
      return Icons.directions_car;
    case 'shopping':
      return Icons.shopping_bag;
    case 'entertainment':
      return Icons.movie;
    case 'bills & utilities':
      return Icons.receipt;
    case 'healthcare':
      return Icons.medical_services;
    case 'education':
      return Icons.school;
    case 'travel':
      return Icons.flight;
    case 'personal care':
      return Icons.face;
    case 'home':
      return Icons.chair; // oppure Icons.home se preferisco
    default:
      return Icons.category; // icona generica per categorie sconosciute
  }
}
