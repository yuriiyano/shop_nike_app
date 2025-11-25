import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:shop_nike_app/blocs/index.dart';
import 'package:shop_nike_app/models/index.dart';
import 'package:shop_nike_app/styles/index.dart';
import '../pages/add_to_cart/add_to_cart_dialog.dart';
import 'cart_product_info.dart';

class CustomCartProductListTile extends StatelessWidget {
  const CustomCartProductListTile({super.key, required this.cartProduct});

  final CartProduct cartProduct;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CartProductInfo(product: cartProduct.product, allowDelete: true),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Quantity',
              style: TextStyle(
                fontFamily: FontFamily.lato,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${cartProduct.cartCount} Items',
                  style: const TextStyle(
                    fontFamily: FontFamily.heebo,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    AddToCartdDialog.show(
                      context,
                      product: cartProduct.product,
                      cartCountInitial: cartProduct.cartCount,
                    );
                  },
                  child: const Text(
                    'change',
                    style: TextStyle(
                      fontFamily: FontFamily.poppins,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Total Product Cost',
              style: TextStyle(
                fontFamily: FontFamily.lato,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '\$${context.read<CartBloc>().state.singleProductTotalCost(cartProduct).toStringAsFixed(2)}',
              style: const TextStyle(
                fontFamily: FontFamily.heebo,
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        const Divider(
          height: 2,
          color: Colors.grey,
        ),
        const SizedBox(height: 25),
      ],
    );
  }
}
