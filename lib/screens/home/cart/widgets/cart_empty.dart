import 'package:flutter/material.dart';

import 'package:shop_nike_app/router/index.dart';
import 'package:shop_nike_app/styles/index.dart';
import 'package:shop_nike_app/widgets/index.dart';


class CartEmpty extends StatelessWidget {
  const CartEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 56),
              child: Text(
                'Bag',
                style: TextStyle(
                  fontFamily: FontFamily.heebo,
                  fontWeight: FontWeight.w500,
                  fontSize: 28,
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.sizeOf(context).width * 0.7,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Assets.images.cart.cartCircle.image(
                        width: 60,
                        height: 60,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Your bag is empty.\nWhen you add products, they'll appear here.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: FontFamily.lato,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                          letterSpacing: -1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: CustomOutlinedButton(
                text: 'Shop Now',
                onPressed: () {
                  context.router.navigate(const ShopRoute());
                },
                width: double.infinity,
                backgroundColor: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
    
  }
}
