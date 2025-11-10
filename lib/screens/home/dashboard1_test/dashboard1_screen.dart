import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stx_bloc_base/stx_bloc_base.dart';

import 'package:shop_nike_app/core/index.dart';
import 'package:shop_nike_app/localization/index.dart';
import 'package:shop_nike_app/router/index.dart';
import 'package:shop_nike_app/blocs/index.dart';

@RoutePage()
class Dashboard1Screen extends StatelessWidget implements AutoRouteWrapper {
  const Dashboard1Screen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    context.read<Dashboard1Bloc>().add(
      const Dashboard1Event.loadProducts(limit: 5),
    );

    return this;
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<Dashboard1Bloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr(LocaleKeys.dashboard)),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => RootScaffold.openDrawer(context),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () {
          bloc.add(const Dashboard1Event.loadProducts(limit: 5));

          return bloc.stream.firstWhere(
            (dashboard1State) => !dashboard1State.status.isLoading,
          );
        },
        child: CustomScrollView(
          slivers: [
            BlocBuilder<Dashboard1Bloc, Dashboard1State>(
              builder: (context, state) {
                switch (state.status) {
                  case NetworkStatus.initial:
                  case NetworkStatus.loading:
                    return const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  case NetworkStatus.success:
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          final product = state.products[index];

                          return Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(product.id.toString()),
                          );
                        },
                        childCount: state.products.length,
                      ),
                    );

                  case NetworkStatus.failure:
                    return SliverFillRemaining(
                      child: Center(child: Text(state.errorMessage ?? '')),
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
