import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MonthSelector extends StatelessWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateChanged;

  const MonthSelector({
    super.key,
    required this.selectedDate,
    required this.onDateChanged,
  });

  @override
  Widget build(BuildContext context) {
    final currentMonth = DateTime.now().month;
    final currentYear = DateTime.now().year;

    final months = [
      DateTime(currentYear, currentMonth - 1),
      DateTime(currentYear, currentMonth),
      DateTime(currentYear, currentMonth + 1),
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            months.map((month) {
              final isSelected =
                  month.month == selectedDate.month &&
                  month.year == selectedDate.year;
              final monthName = DateFormat('MMMM').format(month);

              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: FilterChip(
                  label: Text(monthName),
                  onSelected: (selected) {
                    if (selected) {
                      onDateChanged(month);
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
