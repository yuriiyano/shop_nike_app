import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shop_nike_app/core/index.dart';
import 'package:shop_nike_app/models/index.dart';
import 'package:shop_nike_app/styles/index.dart';
import 'package:shop_nike_app/blocs/index.dart';

class ProductGridCard extends StatefulWidget {
  const ProductGridCard({super.key, required this.product});

  final Product product;

  @override
  State<ProductGridCard> createState() => _ProductGridCardState();
}

class _ProductGridCardState extends State<ProductGridCard> {
  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return LayoutBuilder(
      builder: (context, constraints) {
        final imageSize = constraints.maxWidth;

        return Stack(
          children: [
            Column(
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
                const SizedBox(height: 14),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'BestSeller',
                        style: TextStyle(
                          fontFamily: FontFamily.heebo,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          letterSpacing: -0.5,
                          color: Color.fromARGB(255, 252, 81, 0),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        product.title,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 2,
                        style: const TextStyle(
                          fontFamily: FontFamily.heebo,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          letterSpacing: -0.5,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        product.category.capitalizeFirst,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 2,
                        style: const TextStyle(
                          fontFamily: FontFamily.lato,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          letterSpacing: -0.5,
                          color: Color.fromARGB(255, 118, 118, 118),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '\$${product.price}',
                        style: const TextStyle(
                          fontFamily: FontFamily.heebo,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 12,
              right: 12,
              child: InkWell(
                onTap: () {
                  context.read<ShopBloc>().add(
                    ShopEventToggleFavorite(productId: product.id),
                  );
                },
                child: Container(
                  width: 34,
                  height: 34,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Center(
                    child: product.isFavorite
                        ? Assets.images.shop.favoriteFilled.image(
                            width: 20,
                            height: 20,
                            color: Colors.red,
                          )
                        : Assets.images.shop.favoriteOutlined.image(
                            width: 20,
                            height: 20,
                          ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
