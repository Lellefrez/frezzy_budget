class TransactionCategories {
  static const List<String> incomeCategories = [
    'Salary',
    'Freelane',
    'Investment',
    'Gift',
    'Bonus',
    'Rental',
    'Other Income',
  ];

  static const List<String> expenseCategories = [
    'Restaurant',
    'Transportation',
    'Sghopping',
    'Entertrainment',
    'Bills & Utilities',
    'Healthcare',
    'Education',
    'Travel',
    'Personal Care',
    'Home & Garden',
    'Taxes',
    'Other Expenses',
  ];

  static List<String> getCategoriesForType(String type) {
    return type == 'income' ? incomeCategories : expenseCategories;
  }
}
