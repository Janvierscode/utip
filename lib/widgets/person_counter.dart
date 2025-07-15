import 'package:flutter/material.dart';

class PersonCounter extends StatelessWidget {
  const PersonCounter({
    super.key,
    required this.textTheme,
    required int personCount,
    required this.incrementPersonCount,
    required this.decrementPersonCount,
  }) : _personCount = personCount;

  final TextStyle textTheme;
  final int _personCount;
  final VoidCallback incrementPersonCount;
  final VoidCallback decrementPersonCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Split',
          style: textTheme,
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.remove, color: textTheme.color),
        ),
        Text('$_personCount', style: textTheme),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.add,
            color: textTheme.color,
          ),
        )
      ],
    );
  }
}
