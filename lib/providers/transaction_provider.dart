import 'package:flutter/foundation.dart';
import 'package:frezzy_budget/models/transaction.dart';

class TransactionProvider extends ChangeNotifier {
  List<Transaction> _transactions = [];
  DateTime _selectedDate = DateTime.now();

  List<Transaction> get transactions => _transactions;
  DateTime get selectedDate => _selectedDate;

  bool addTransection(Transaction transaction) {
    _transactions.add(transaction);
    //inoltre metto le transazioni in ordine di data
    _transactions.sort((a, b) => b.date.compareTo(a.date));
    notifyListeners();
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
