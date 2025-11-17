import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shop_nike_app/blocs/index.dart';
import 'package:shop_nike_app/models/index.dart';
import 'package:shop_nike_app/router/index.dart';
import 'package:shop_nike_app/styles/index.dart';
import 'package:shop_nike_app/models/filter/product_filter_model.dart';
import 'widgets/index.dart';

@RoutePage()
class ShopScreen extends StatelessWidget implements AutoRouteWrapper {
  const ShopScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    context.read<ShopBloc>().load();

    return this;
  }

  @override
  Widget build(BuildContext context) {
    final shopBloc = context.read<ShopBloc>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Shop'),
        titleTextStyle: const TextStyle(
          fontFamily: FontFamily.heebo,
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Colors.black,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              final productFilterModel = await context.router
                  .push<ProductFilterModel?>(
                     FilterModalRoute(initialFilter: shopBloc.state.filter),
                  );
              if (productFilterModel == null) return;
              shopBloc.filter(productFilterModel);
            },
            icon: Assets.images.shop.filter.svg(width: 24),
          ),
          IconButton(
            onPressed: () async {
              final query = await context.router.push<String?>(
                const SearchModalRoute(),
              );

              if (!context.mounted || query == null) return;

              shopBloc.search(query);
            },
            icon: Assets.images.shop.search.svg(width: 24),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: shopBloc.loadAsyncFuture,
        child: BlocBuilder<ShopBloc, ShopState>(
          builder: (context, state) {
            switch (state.status) {
              case NetworkStatus.initial:
              case NetworkStatus.loading:
                return const Center(child: CircularProgressIndicator());
              case NetworkStatus.success:
                final products = state.visibleData;

                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
    );
  }
}
