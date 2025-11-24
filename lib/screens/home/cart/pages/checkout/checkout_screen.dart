import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shop_nike_app/blocs/index.dart';
import 'package:shop_nike_app/models/index.dart';
import 'package:shop_nike_app/router/router.gr.dart';
import 'package:shop_nike_app/screens/home/cart/widgets/index.dart';
import 'package:shop_nike_app/styles/index.dart';
import 'package:shop_nike_app/widgets/index.dart';
import 'widgets/index.dart';

@RoutePage()
class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({
    super.key,
    required this.receiver,
    required this.cartProducts,
  });

  final ReceiverModel receiver;
  final List<CartProduct> cartProducts;

  @override
  Widget build(BuildContext context) {
    const horizontalPadding = 20.0;

    final cartBloc = context.read<CartBloc>();

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                      vertical: 22,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Thank You\nFor Your Order',
                          style: TextStyle(
                            fontFamily: FontFamily.heebo,
                            fontWeight: FontWeight.w500,
                            fontSize: 28,
                          ),
                        ),
                        IconButton(
                          onPressed: () => context.router.maybePop(),
                          icon: const Icon(
                            Icons.cancel_rounded,
                            size: 46,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Color.fromARGB(255, 200, 200, 200),
                    thickness: 6,
                    height: 12,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                      vertical: 22,
                    ),
                    child: Text(
                      'Receiver info:',
                      style: TextStyle(
                        fontFamily: FontFamily.lato,
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      CheckoutReceiverInfoItem(
                        receiver: receiver,
                        infoLabel: 'Firstname',
                        infoValue: receiver.firstname,
                        horizontalPadding: horizontalPadding,
                      ),
                      CheckoutReceiverInfoItem(
                        receiver: receiver,
                        infoLabel: 'Lastname',
                        infoValue: receiver.lastname,
                        horizontalPadding: horizontalPadding,
                      ),
                      CheckoutReceiverInfoItem(
                        receiver: receiver,
                        infoLabel: 'Address',
                        infoValue: receiver.address,
                        horizontalPadding: horizontalPadding,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Divider(
                    color: Color.fromARGB(255, 200, 200, 200),
                    thickness: 6,
                    height: 12,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                      vertical: 22,
                    ),
                    child: Text(
                      'Ordered products:',
                      style: TextStyle(
                        fontFamily: FontFamily.lato,
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                    ),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Total: ',
                              style: TextStyle(
                                fontFamily: FontFamily.heebo,
                                fontWeight: FontWeight.w500,
                                fontSize: 22,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text:
                                  '\$${cartBloc.allProductsTotalCost().toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontFamily: FontFamily.heebo,
                                fontWeight: FontWeight.w700, // bolder
                                fontSize: 20, // bigger
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: cartProducts
                        .map(
                          (cartProduct) => Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: horizontalPadding,
                              vertical: 16,
                            ),
                            child: CartProductInfo(
                              product: cartProduct.product,
                              itemsCount: cartProduct.cartCount,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ColoredBox(
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Divider(
                      color: Color.fromARGB(255, 228, 228, 228),
                      height: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 10,
                      ),
                      child: CustomOutlinedButton(
                        text: 'Go to Shop',
                        onPressed: () =>
                            context.router.navigate(const ShopRoute()),
                        width: double.infinity,
                        backgroundColor: Colors.black,
                        borderColor: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
