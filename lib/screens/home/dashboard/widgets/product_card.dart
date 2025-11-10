import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:shop_nike_app/models/index.dart';
import 'package:shop_nike_app/styles/index.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    required this.productCardWidth,
  });

  final Product product;
  final double productCardWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: productCardWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: productCardWidth,
            height: productCardWidth,
            color: Colors.grey.shade200,
            child: Align(
              child: CachedNetworkImage(
                imageUrl: product.image,
                width: productCardWidth * 0.8,
                height: productCardWidth * 0.8,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            product.title,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontFamily: FontFamily.heebo,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'US\$${product.price.toString().replaceFirst('.', '`')}',
            style: const TextStyle(
              fontFamily: FontFamily.heebo,
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Color.fromARGB(255, 118, 118, 118),
            ),
          ),
        ],
      ),
    );
  }
}
