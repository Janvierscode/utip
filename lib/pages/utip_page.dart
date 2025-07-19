import 'package:flutter/material.dart';
import "package:provider/provider.dart";
import 'package:utip/provider/ThemeProvider.dart';
import 'package:utip/provider/UTipProvider.dart';
import 'package:utip/widgets/bill_amount_field.dart';
import 'package:utip/widgets/person_counter.dart';
import 'package:utip/widgets/tip_row.dart';
import 'package:utip/widgets/tip_slider.dart';
import 'package:utip/widgets/total_per_person.dart';

class UTip extends StatelessWidget {
  const UTip({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UTipProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    var theme = Theme.of(context);
    final style = theme.textTheme.titleMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
    );
    final textTheme = style.copyWith(color: theme.colorScheme.onSurface);

    return Scaffold(
      appBar: AppBar(
        title: Text('uTip'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              onPressed: themeProvider.toggleTheme,
              icon: Icon(
                themeProvider.isDarkMode
                    ? Icons.light_mode_outlined
                    : Icons.dark_mode_outlined,
                color: theme.colorScheme.primary,
                fill: 0.5,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TotalPerPerson(
                  theme: theme,
                  style: style,
                  total: provider.totalPerPerson,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: theme.colorScheme.primary,
                      width: 3,
                    ),
                  ),
                  child: Column(
                    children: [
                      BillAmountField(
                        textTheme: textTheme,
                        // billAmount: provider.billTotal.toString(),
                        onChanged: (value) {
                          if (value.isEmpty) {
                            return;
                          }
                          provider.updateBillTotal(double.parse(value));
                        },
                      ),
                      PersonCounter(
                        textTheme: textTheme,
                        personCount: provider.personCount,
                        onIncrementPersonCount: () {
                          provider.updatePersonCount(provider.personCount + 1);
                        },
                        onDecrementPersonCount: () {
                          if (provider.personCount > 1) {
                            provider.updatePersonCount(
                              provider.personCount - 1,
                            );
                          }
                        },
                      ),
                      const SizedBox(height: 8),
                      TipRow(textTheme: textTheme, totalTip: provider.totalTip),
                      const SizedBox(height: 8),
                      Text(
                        '${(provider.tipPercentage * 100).round()}',
                        style: textTheme,
                      ),
                      const SizedBox(height: 8),
                      TipSlider(
                        tipPercentage: provider.tipPercentage,
                        onChanged: (double value) {
                          provider.updateTipPercentage(value);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
