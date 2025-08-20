import 'package:flutter/material.dart';
import 'package:frezzy_budget/constants/categories.dart';
import 'package:intl/intl.dart';

class CategorySelector extends StatelessWidget {
  final String selectedCategory;
  final Function(String) onCategoryChanged;

  const CategorySelector({
    super.key,
    required this.selectedCategory,
    required this.onCategoryChanged,
  });

  @override
  Widget build(BuildContext context) {
    final currentCategory = 'all';

    final categories = [
      "all",
      ...TransactionCategories.expenseCategories,
      ...TransactionCategories.incomeCategories,
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            categories.map((category) {
              final isSelected = category == selectedCategory;

              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: FilterChip(
                  label: Text(category),
                  selected: isSelected,
                  onSelected: (selected) {
                    if (selected) {
                      onCategoryChanged(category);
                    }
                  },
                  backgroundColor: Colors.white,
                  selectedColor: Colors.blue[100],
                  checkmarkColor: Colors.blue,
                ),
              );
            }).toList(),
      ),
    );
  }
}
