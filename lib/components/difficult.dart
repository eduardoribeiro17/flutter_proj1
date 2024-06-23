import 'package:flutter/material.dart';

class Difficult extends StatelessWidget {
  final int difficult;
  const Difficult({super.key, required this.difficult});

  @override
  Widget build(BuildContext context) {
    final List<Widget> rows = [];
    int i = 1;

    while (i <= 5) {
      final color = (difficult >= i) ? Colors.blue : Colors.blue[100];

      rows.add(Icon(Icons.star, size: 15, color: color));

      i++;
    }

    return Row(children: [...rows]);
  }
}
