import 'package:flutter/material.dart';

class TotalPerPerson extends StatelessWidget {
  const TotalPerPerson({
    super.key,
    required this.theme,
    required this.style,
    required this.total,
  });

  final ThemeData theme;
  final TextStyle style;
  final double total;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      //color: theme.colorScheme
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Total per person', style: style),
          Text(
            '\$ ${total.toStringAsFixed(2)}',
            style: style.copyWith(
              fontSize: theme.textTheme.displaySmall!.fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
