import 'package:flutter/material.dart';

import 'package:shop_nike_app/styles/index.dart';
import 'package:shop_nike_app/widgets/index.dart';

class AddToCartFailureResultContent extends StatelessWidget {
  const AddToCartFailureResultContent({
    super.key,
    required this.horizontalPadding,
  });

  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Center(
        child: Column(
          children: [
            const Spacer(),
            const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.cancel_rounded,
                  size: 70,
                ),
                Text(
                  'Operation Failed',
                  style: TextStyle(
                    fontFamily: FontFamily.heebo,
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
              ),
              child: CustomOutlinedButton(
                text: 'Close',
                onPressed: () {
                  Navigator.of(context).pop();
                },
                width: double.infinity,
                backgroundColor: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
