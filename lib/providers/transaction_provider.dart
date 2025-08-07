import 'package:flutter/foundation.dart';
import 'package:frezzy_budget/models/transaction.dart';

List<Transaction> mockTransactions = [
  Transaction(
    id: "id",
    userId: "userId",
    amount: 5000,
    type: "income",
    category: "Salary",
    date: DateTime(2025, 08, 07),
    createdAt: DateTime(2025, 08, 07),
  ),
  Transaction(
    id: "id",
    userId: "userId",
    amount: 50,
    type: "expense",
    category: "Restaurant",
    date: DateTime(2025, 08, 07),
    createdAt: DateTime(2025, 08, 07),
  ),
];

class TransactionProvider extends ChangeNotifier {
  List<Transaction> _transactions = mockTransactions;

  List<Transaction> get transactions => _transactions;

  bool addTransection(Transaction transaction) {
    _transactions.add(transaction);
    //inoltre metto le transazioni in ordine di data
    _transactions.sort((a, b) => b.date.compareTo(a.date));
    return true;
  }

  //il totale delle mie transazioni
  double get totalBalance {
    //per ogni transazione del mio array
    return _transactions.fold(0.0, (sum, transaction) {
      //aggiungilo ad una variabile (sum)
      return sum +
          //verifico se è un entrata la aggiungo, se non lo è la sottraggo
          (transaction.isIncome ? transaction.amount : -transaction.amount);
    });
  }
}
