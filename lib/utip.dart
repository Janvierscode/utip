import 'package:flutter/material.dart';
import 'package:utip/widgets/person_counter.dart';

class Utip extends StatefulWidget {
  const Utip({super.key});

  @override
  State<Utip> createState() => _UtipState();
}

class _UtipState extends State<Utip> {
  int _personCount = 1;

  void _incrementPersonCount() {
    setState(() {
      _personCount++;
    });
  }

  void _decrementPersonCount() {
    if (_personCount <= 0) {
      return;
    }
    setState(() {
      _personCount--;
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final style = theme.textTheme.titleMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
    );
    final textTheme = style.copyWith(
      color: theme.colorScheme.onSurface,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'UTip',
          style: textTheme.copyWith(
            fontSize: theme.textTheme.titleLarge!.fontSize,
            fontWeight: FontWeight.normal,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Icon(Icons.toggle_off_outlined,
                color: theme.colorScheme.primary, fill: 0.5, size: 50),
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
                Container(
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
                        '\$20.12',
                        style: style.copyWith(
                          fontSize: theme.textTheme.displaySmall!.fontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          color: theme.colorScheme.primary, width: 3),
                    ),
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            prefixIcon: const Icon(Icons.attach_money_outlined),
                            hintText: '100.56',
                            labelText: 'Bill Amount',
                          ),
                          style: textTheme,
                          keyboardType: TextInputType.number,
                        ),
                        PersonCounter(
                            textTheme: textTheme,
                            personCount: _personCount,
                            incrementPersonCount: _incrementPersonCount,
                            decrementPersonCount: _decrementPersonCount),
                        const SizedBox(height: 8),
                        Row(children: [
                          Text(
                            'Tip',
                            style: textTheme,
                          ),
                          const Spacer(),
                          Text(
                            '20.13',
                            style: textTheme,
                          ),
                        ]),
                        const SizedBox(height: 8),
                        Text(
                          '20%',
                          style: textTheme,
                        ),
                        const SizedBox(height: 8),
                        Slider(value: 0.5, onChanged: (value) {})
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
