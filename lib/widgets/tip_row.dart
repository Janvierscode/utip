import 'package:flutter/material.dart';

class TipRow extends StatelessWidget {
  const TipRow({super.key, required this.textTheme, required this.totalTip});

  final TextStyle textTheme;
  final double totalTip;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Tip', style: textTheme),
        const Spacer(),
        Text('\$ ${totalTip.toStringAsFixed(2)}', style: textTheme),
      ],
    );
  }
}
