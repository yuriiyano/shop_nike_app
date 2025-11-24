import 'package:flutter/material.dart';

import 'package:shop_nike_app/styles/index.dart';

class NumberPicker extends StatelessWidget {
  const NumberPicker({
    super.key,
    required this.number,
    required this.onValueChange,
  });

  final int number;
  final ValueChanged<int> onValueChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: Colors.grey,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () => onValueChange(-1),
            icon: const Icon(
              Icons.remove,
              size: 20,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  number.toString(),
                  style: const TextStyle(
                    fontFamily: FontFamily.heebo,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                const Divider(
                  color: Color.fromARGB(255, 228, 228, 228),
                  height: 2,
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => onValueChange(1),
            icon: const Icon(
              Icons.add,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
