import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shop_nike_app/router/index.dart';
import 'package:shop_nike_app/blocs/index.dart';
import 'package:shop_nike_app/models/index.dart';
import 'package:shop_nike_app/styles/index.dart';
import './widgets/index.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget implements AutoRouteWrapper {
  const DashboardScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    context.read<DashboardBloc>().load();

    return this;
  }

  @override
  Widget build(BuildContext context) {
    const double horizontalPadding = 24;

    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: context.read<DashboardBloc>().loadAsyncFuture,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    horizontal: horizontalPadding,
                    vertical: 50,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Discover',
                          style: TextStyle(
                            fontFamily: FontFamily.heebo,
                            fontWeight: FontWeight.w500,
                            fontSize: 28,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Tuesday, 3 May',
                          style: TextStyle(
                            fontFamily: FontFamily.lato,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color.fromARGB(255, 118, 118, 118),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Assets.images.dashboard.dashboardMain.image(
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                const Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    horizontal: horizontalPadding,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 40),
                        Text(
                          'What\u2019s new',
                          style: TextStyle(
                            fontFamily: FontFamily.heebo,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'The latest arrivals from Nike',
                          style: TextStyle(
                            fontFamily: FontFamily.lato,
                            fontWeight: FontWeight.w500,
                            fontSize: 28,
                            color: Color.fromARGB(255, 118, 118, 118),
                          ),
                        ),
                        SizedBox(height: 22),
                      ],
                    ),
                  ),
                ),
                BlocBuilder<DashboardBloc, NetworkListState<Product>>(
                  builder: (context, state) {
                    switch (state.status) {
                      case NetworkStatus.initial:
                      case NetworkStatus.loading:
                        return const Center(child: CircularProgressIndicator());
                      case NetworkStatus.success:
                        return LayoutBuilder(
                          builder: (context, constraints) {
                            final cardWidth =
                                constraints.maxWidth - horizontalPadding * 2 - 10;
                            final carouselHeight = constraints.maxWidth + 40;

                            return ProductsCarousel(
                              products: state.data,
                              carouselHeight: carouselHeight,
                              carouselHorizontalPadding: horizontalPadding,
                              cardWidth: cardWidth,
                              cardsGap: horizontalPadding / 4,
                            );
                          },
                        );
                      case NetworkStatus.failure:
                        return Center(child: Text(state.errorMsg));
                    }
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
