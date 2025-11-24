import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shop_nike_app/blocs/index.dart';
import 'package:shop_nike_app/models/index.dart';
import 'package:shop_nike_app/styles/index.dart';

class CartProductInfo extends StatelessWidget {
  const CartProductInfo({
    super.key,
    required this.product,
    this.allowDelete = false,
    this.itemsCount,
  });

  final Product product;
  final bool allowDelete;
  final int? itemsCount;

  @override
  Widget build(BuildContext context) {
    const horizontalPadding = 24.0;
    
    final deviceWidth = MediaQuery.sizeOf(context).width;
    final imageSize = (deviceWidth - horizontalPadding * 2 - 16) * 0.5;

    final cartBloc = context.read<CartBloc>();

    return SizedBox(
      height: imageSize,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: imageSize,
            height: imageSize,
            color: Colors.grey.shade200,
            child: Align(
              child: CachedNetworkImage(
                imageUrl: product.image,
                width: imageSize * 0.8,
                height: imageSize * 0.8,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (allowDelete)
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {
                        cartBloc.add(
                          CartEventDeleteProductFromCart(productId: product.id),
                        );
                      },
                      child: const Text(
                        'delete',
                        style: TextStyle(
                          fontFamily: FontFamily.poppins,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                Text(
                  product.title,
                  softWrap: true,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: FontFamily.heebo,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  product.category,
                  style: const TextStyle(
                    fontFamily: FontFamily.heebo,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color.fromARGB(
                      255,
                      118,
                      118,
                      118,
                    ),
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontFamily: FontFamily.heebo,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    if (itemsCount != null)
                      Text(
                        '($itemsCount item${(itemsCount! > 1) ? 's' : ''})',
                        style: const TextStyle(
                          fontFamily: FontFamily.heebo,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      )
                    else
                      const SizedBox.shrink(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
