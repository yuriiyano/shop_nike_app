import 'package:flutter/material.dart';

import 'package:shop_nike_app/router/index.dart';
import 'package:shop_nike_app/styles/index.dart';
import 'package:shop_nike_app/widgets/index.dart';

class AddToCartSuccessResultContent extends StatelessWidget {
  const AddToCartSuccessResultContent({
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
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Assets.images.cart.checkedCircle.image(
                  width: 70,
                  height: 70,
                ),
                const Text(
                  'Added to Bag',
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
                text: 'View Bag',
                onPressed: () {
                  Navigator.of(context).pop();
                  context.router.navigate(const CartRoute());
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
