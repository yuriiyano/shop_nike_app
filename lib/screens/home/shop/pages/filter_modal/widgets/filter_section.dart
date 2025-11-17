import 'package:flutter/material.dart';

import 'package:shop_nike_app/styles/index.dart';

class FilterSection extends StatelessWidget {
  final String name;
  final Widget child;

  const FilterSection({
    super.key,
    required this.name,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    const double horizontalPadding = 24;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: horizontalPadding,
            ),
            child: Text(
              name,
              style: const TextStyle(
                fontFamily: FontFamily.heebo,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: horizontalPadding,
            ),
            child: child,
          ),
        ],
      ),
    );
  }
}
