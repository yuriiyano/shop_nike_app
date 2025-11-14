import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shop_nike_app/blocs/index.dart';
import 'package:shop_nike_app/core/index.dart';
import 'package:shop_nike_app/models/index.dart';
import 'package:shop_nike_app/styles/index.dart';
import 'package:shop_nike_app/widgets/index.dart';
import 'package:shop_nike_app/screens/home/dashboard/widgets/index.dart';

@RoutePage()
class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final shopBloc = context.read<ShopBloc>();

    final deviceWidth = MediaQuery.sizeOf(context).width;
    final imageHeight = deviceWidth * 1.2;
    const double horizontalPadding = 24;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: SizedBox(
          width: deviceWidth * 0.5,
          child: Text(
            product.title,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: FontFamily.heebo,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.5,
            ),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => context.router.maybePop(),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          iconSize: 24,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.grey.shade200,
              width: deviceWidth,
              height: imageHeight,
              child: Center(
                child: CachedNetworkImage(
                  imageUrl: product.image,
                  width: deviceWidth * 0.9,
                  height: deviceWidth * 0.9,
                ),
              ),
            ),
            const SizedBox(height: 35),
            Padding(
              padding: const EdgeInsetsGeometry.symmetric(
                horizontal: horizontalPadding,
              ),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.category.capitalizeFirst,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                        fontFamily: FontFamily.lato,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      product.title.capitalizeFirst,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      maxLines: 2,
                      style: const TextStyle(
                        fontFamily: FontFamily.heebo,
                        fontWeight: FontWeight.w500,
                        fontSize: 28,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '\$${product.price}',
                      style: const TextStyle(
                        fontFamily: FontFamily.heebo,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      product.description,
                      style: const TextStyle(
                        height: 1.5,
                        fontFamily: FontFamily.lato,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 43),
                    CustomOutlinedButton(
                      text: 'Add to Bag',
                      onPressed: () {},
                      width: double.infinity,
                      backgroundColor: Colors.black,
                    ),
                    const SizedBox(height: 20),
                    BlocSelector<ShopBloc, ShopState, bool>(
                      selector: (state) =>
                          shopBloc.isProductFavorite(productId: product.id),
                      builder: (context, isFavorite) {
                        // final isFavoriteFinal =
                        //     isFavorite || product.isFavorite;
                        return CustomOutlinedButton(
                          text: 'Favourite',
                          icon: isFavorite
                              ? Assets.images.shop.favoriteFilled.image(
                                  width: 20,
                                  height: 20,
                                  color: Colors.red,
                                )
                              : Assets.images.shop.favoriteOutlined.image(
                                  width: 20,
                                  height: 20,
                                ),
                          onPressed: () {
                            shopBloc.add(
                              ShopEventToggleFavorite(productId: product.id),
                            );
                          },
                          width: double.infinity,
                          textColor: Colors.black,
                          borderColor: const Color.fromARGB(255, 228, 228, 228),
                          backgroundColor: Colors.white,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            BlocBuilder<ShopBloc, ShopState>(
              builder: (context, state) {
                switch (state.status) {
                  case NetworkStatus.initial:
                  case NetworkStatus.loading:
                    return const Center(child: CircularProgressIndicator());
                  case NetworkStatus.success:
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: horizontalPadding,
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 32),
                              Text(
                                'You Might Also Like',
                                style: TextStyle(
                                  height: 1.2,
                                  fontFamily: FontFamily.helveticaNowText,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(height: 38),
                            ],
                          ),
                        ),
                        LayoutBuilder(
                          builder: (context, constraints) {
                            final cardWidth = constraints.maxWidth * 0.7;
                            final carouselHeight =
                                constraints.maxWidth * 0.7 + 100;
                            final filteredProducts = shopBloc
                                .filterProductsByCategory(
                                  category: product.category,
                                )
                                .where((e) => e.id != product.id)
                                .toList();

                            return ProductsCarousel(
                              products: filteredProducts,
                              carouselHeight: carouselHeight,
                              carouselHorizontalPadding: horizontalPadding,
                              cardWidth: cardWidth,
                              cardsGap: horizontalPadding / 4,
                            );
                          },
                        ),
                      ],
                    );
                  case NetworkStatus.failure:
                    return Center(child: Text(state.errorMsg));
                }
              },
            ),
            const SizedBox(height: 57),
          ],
        ),
      ),
    );
  }
}
