import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shop_nike_app/models/index.dart';
import 'package:shop_nike_app/router/index.dart';
import 'package:shop_nike_app/blocs/index.dart';
import 'package:shop_nike_app/screens/home/cart/widgets/index.dart';
import 'package:shop_nike_app/styles/index.dart';
import 'package:shop_nike_app/widgets/index.dart';

@RoutePage()
class CartScreen extends StatelessWidget implements AutoRouteWrapper {
  const CartScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    context.read<CartBloc>().load();
    return this;
  }

  @override
  Widget build(BuildContext context) {
    final cartBloc = context.read<CartBloc>();

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            switch (state.status) {
              case NetworkStatus.initial:
              case NetworkStatus.loading:
                return const Center(child: CircularProgressIndicator());
              case NetworkStatus.success:
                if (cartBloc.state.data.isEmpty) {
                  return const CartEmpty();
                }
                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 36, bottom: 20),
                            child: Text(
                              'Bag',
                              style: TextStyle(
                                fontFamily: FontFamily.heebo,
                                fontWeight: FontWeight.w500,
                                fontSize: 28,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: state.data
                                    .map(
                                      (cartProduct) =>
                                          CustomCartProductListTile(
                                            cartProduct: cartProduct,
                                          ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                          const SizedBox(height: 120),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 120,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 16,
                              spreadRadius: 2,
                              offset: Offset(0, -2),
                              color: Colors.black26,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Total:',
                                    style: TextStyle(
                                      fontFamily: FontFamily.lato,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    '\$${cartBloc.state.allProductsTotalCost().toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      fontFamily: FontFamily.heebo,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 24,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              child: CustomOutlinedButton(
                                text: 'Checkout',
                                onPressed: () async {
                                  final receiverModel = await context.router
                                      .push<ReceiverModel?>(
                                        const ReceiverInformationRoute(),
                                      );
                                  if (receiverModel == null ||
                                      !context.mounted) {
                                    return;
                                  }

                                  cartBloc.add(
                                    CartEventDeleteAllProductsFromCart(),
                                  );

                                  await context.router.push(
                                    CheckoutRoute(
                                      receiver: receiverModel,
                                      cartProducts: cartBloc.state.data,
                                    ),
                                  );
                                },
                                width: double.infinity,
                                backgroundColor: Colors.black,
                              ),
                            ),
                            const Spacer(
                              flex: 3,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              case NetworkStatus.failure:
                return const CartEmpty();
            }
          },
        ),
      ),
    );
  }
}
