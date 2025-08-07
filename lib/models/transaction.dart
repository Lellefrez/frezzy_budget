class Transaction {
  final String id;
  final String userId;
  final double amount;
  final String type;
  final String category;
  final DateTime date;
  final DateTime createdAt;

  Transaction({
    required this.id,
    required this.userId,
    required this.amount,
    required this.type,
    required this.category,
    required this.date,
    required this.createdAt,
  });

  bool get isIncome => type == "income";
}
