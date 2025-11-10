import 'package:flutter/material.dart';

import 'package:shop_nike_app/models/index.dart';
import 'index.dart';

class ProductsCarousel extends StatelessWidget {
  const ProductsCarousel({
    super.key,
    required this.products,
    required this.carouselHeight,
    required this.carouselHorizontalPadding,
    required this.cardWidth,
    required this.cardsGap,
  });

  final List<Product> products;

  final double carouselHeight;
  final double carouselHorizontalPadding;

  final double cardWidth;
  final double cardsGap;

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
              width: cardWidth,
            ),
          );
        },
      ),
    );
  }
}
