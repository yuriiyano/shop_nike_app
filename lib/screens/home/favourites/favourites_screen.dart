import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shop_nike_app/blocs/index.dart';
import 'package:shop_nike_app/models/index.dart';
import 'package:shop_nike_app/router/index.dart';
import 'package:shop_nike_app/styles/index.dart';
import '../shop/widgets/product_grid_card.dart';
import 'widgets/index.dart';

@RoutePage()
class FavouritesScreen extends StatelessWidget implements AutoRouteWrapper {
  const FavouritesScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    context.read<ShopBloc>().initLoadAsyncFuture().then((_) {
      if (!context.mounted) return;
      context.read<FavouritesBloc>().load();
    });

    return this;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Favourites'),
        titleTextStyle: const TextStyle(
          fontFamily: FontFamily.heebo,
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Colors.black,
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: context.read<FavouritesBloc>().loadAsyncFuture,
        child: FavouritesBlocListener(
          child: BlocBuilder<FavouritesBloc, FavouritesState>(
            builder: (context, state) {
              switch (state.status) {
                case NetworkStatus.initial:
                case NetworkStatus.loading:
                  return const Center(child: CircularProgressIndicator());
                case NetworkStatus.success:
                  final products = state.data;

                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 6,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.57,
                        ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];

                      return InkWell(
                        onTap: () => context.router.push(
                          ProductDetailsRoute(product: product),
                        ),
                        child: ProductGridCard(product: product),
                      );
                    },
                  );
                case NetworkStatus.failure:
                  return Center(child: Text(state.errorMsg));
              }
            },
          ),
        ),
      ),
    );
  }
}
