import 'package:flutter/foundation.dart';
import 'package:frezzy_budget/models/transaction.dart';

class TransactionProvider extends ChangeNotifier {
  List<Transaction> _transactions = [];
  DateTime _selectedDate = DateTime.now();
  String _selectedCategory = "all";

  List<Transaction> get transactions => _transactions;
  DateTime get selectedDate => _selectedDate;
  String get selectedCategory => _selectedCategory;

  bool addTransection(Transaction transaction) {
    _transactions.add(transaction);
    //inoltre metto le transazioni in ordine di data
    _transactions.sort((a, b) => b.date.compareTo(a.date));
    notifyListeners();
    return true;
  }

  //controllo che per ogni trasazione l'anno e la data siano quelli della data selezionata
  List<Transaction> get filteredTransactions {
    return _transactions.where((transaction) {
      return transaction.date.year == _selectedDate.year &&
          transaction.date.month == _selectedDate.month &&
          (transaction.category.toLowerCase() ==
                  _selectedCategory.toLowerCase() ||
              _selectedCategory == 'all');
    }).toList();
  }

  //il totale delle mie transazioni
  double get totalBalance {
    //per ogni transazione del mio array
    return filteredTransactions.fold(0.0, (sum, transaction) {
      //aggiungilo ad una variabile (sum)
      return sum +
          //verifico se è un entrata la aggiungo, se non lo è la sottraggo
          (transaction.isIncome ? transaction.amount : -transaction.amount);
    });
  }

  void setSelectedDate(int year, int month) {
    _selectedDate = DateTime(year, month);
    notifyListeners();
  }

  void setSelectedCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }
}
