import 'package:flutter/material.dart';

import 'package:shop_nike_app/styles/index.dart';

class FormFieldSection extends StatelessWidget {
  const FormFieldSection({
    super.key,
    required this.name,
    required this.child,
    this.horizontalPadding = 24,
  });

  final String name;
  final Widget child;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
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
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
            ),
            child: child,
          ),
        ],
      ),
    );
  }
}
