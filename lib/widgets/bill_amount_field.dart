import 'package:flutter/material.dart';

class BillAmountField extends StatelessWidget {
  const BillAmountField({
    super.key,
    required this.textTheme,
    required this.onChanged,
  });

  final TextStyle textTheme;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        prefixIcon: const Icon(Icons.attach_money_outlined),
        hintText: '10.50',
        labelText: 'Bill Amount',
      ),
      style: textTheme,
      keyboardType: TextInputType.number,
      onChanged: onChanged,
    );
  }
}
