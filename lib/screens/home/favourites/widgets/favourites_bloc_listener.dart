import 'package:flutter/material.dart';

import 'package:darq/darq.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shop_nike_app/blocs/index.dart';
import 'package:shop_nike_app/models/index.dart';

class FavouritesBlocListener extends StatelessWidget {
  const FavouritesBlocListener({super.key, required this.child});

  final Widget child;

  List<Product> _favoriteProducts(List<Product> products) {
    return products.where((product) => product.isFavorite).toList();
  }

  Set<int> _favoriteProductsUniqueIds(List<Product> products) {
    return _favoriteProducts(products).map((product) => product.id).toSet();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ShopBloc, ShopState>(
      listenWhen: (previous, current) =>
          previous.data != current.data &&
          !_favoriteProductsUniqueIds(previous.data).sequenceEquals(
            _favoriteProductsUniqueIds(current.data),
          ),
      listener: (context, state) {
        final updatedFavoriteProducts = _favoriteProducts(state.data);
        context.read<FavouritesBloc>().update(updatedFavoriteProducts);
      },
      child: child,
    );
  }
}
