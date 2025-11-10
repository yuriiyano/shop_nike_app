import 'package:flutter/material.dart';

import 'package:shop_nike_app/models/index.dart';
import 'index.dart';

class ProductsCarousel extends StatelessWidget {
  const ProductsCarousel({
    super.key,
    required this.products,
    required this.productCardWidth,
    required this.carouselHeight,
    required this.cardsGap,
    required this.carouselHorizontalPadding,
  });

  final List<Product> products;
  final double productCardWidth;
  final double carouselHeight;
  final double cardsGap;
  final double carouselHorizontalPadding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: carouselHeight,
      child: ListView.builder(
        itemCount: products.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final product = products[index];
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? carouselHorizontalPadding : cardsGap,
              right: index == products.length - 1
                  ? carouselHorizontalPadding
                  : 0,
            ),
            child: ProductCard(
              product: product,
              productCardWidth: productCardWidth,
            ),
          );
        },
      ),
    );
  }
}
