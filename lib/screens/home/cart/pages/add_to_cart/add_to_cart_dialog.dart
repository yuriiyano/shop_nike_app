import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shop_nike_app/models/index.dart';
import 'package:shop_nike_app/services/index.dart';
import 'package:shop_nike_app/blocs/index.dart';
import 'add_to_cart_bloc.dart';
import 'widgets/index.dart';

class AddToCartdDialog extends StatefulWidget {
  const AddToCartdDialog({
    super.key,
    required this.product,
  });

  final Product product;

  static Future show(
    BuildContext context, {
    required Product product,
    int? cartCountInitial,
  }) {
    final deviceHeight = MediaQuery.sizeOf(context).height;

    return showModalBottomSheet(
      context: context,
      showDragHandle: true,
      constraints: BoxConstraints.tight(Size.fromHeight(deviceHeight * 0.5)),
      backgroundColor: Colors.white,
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      builder: (context) {
        return BlocProvider(
          create: (context) =>
              getIt<AddToCartBloc>(param1: product, param2: cartCountInitial),
          child: AddToCartdDialog(
            product: product,
          ),
        );
      },
    );
  }

  @override
  State<AddToCartdDialog> createState() => _AddToCartdDialogState();
}

class _AddToCartdDialogState extends State<AddToCartdDialog> {
  bool showSuccessMessage = false;

  bool isCartProductEditingFinished(
    CartState previous,
    CartState current,
    AddToCartBloc formBloc,
  ) =>
      previous.status != current.status &&
      formBloc.isEditing &&
      current.status.isSuccess;

  bool isCartProductCountChanged(
    CartState previous,
    CartState current,
    CartBloc cartBloc,
  ) {
    if (!current.status.isSuccess) return false;

    final previousItemsCount = cartBloc.productItemsCount(
      productId: widget.product.id,
      cartState: previous,
    );

    if (previousItemsCount == 0) return false;

    final currentItemsCount = cartBloc.productItemsCount(
      productId: widget.product.id,
      cartState: current,
    );

    return previousItemsCount != currentItemsCount;
  }

  void showSuccessTemporarily() {
    setState(() => showSuccessMessage = true);
  }

  @override
  Widget build(BuildContext context) {
    const horizontalPadding = 24.0;
    final deviceWidth = MediaQuery.sizeOf(context).width;

    final formBloc = context.read<AddToCartBloc>();
    final cartBloc = context.read<CartBloc>();

    return SafeArea(
      top: false,
      child: Stack(
        children: [
          MultiBlocListener(
            listeners: [
              BlocListener<CartBloc, CartState>(
                bloc: cartBloc,
                listenWhen: (previous, current) =>
                    isCartProductEditingFinished(previous, current, formBloc) ||
                    isCartProductCountChanged(previous, current, cartBloc),
                listener: (context, state) {
                  Navigator.of(context).pop();
                },
              ),
              BlocListener<CartBloc, CartState>(
                bloc: cartBloc,
                listenWhen: (previous, current) =>
                    previous.data.length != current.data.length &&
                    !cartBloc.isProductInCart(
                      productId: widget.product.id,
                      cartState: previous,
                    ) &&
                    cartBloc.isProductInCart(
                      productId: widget.product.id,
                      cartState: current,
                    ),
                listener: (context, state) {
                  showSuccessTemporarily();
                },
              ),
            ],
            child: BlocBuilder<CartBloc, CartState>(
              bloc: cartBloc,
              buildWhen: (previous, current) =>
                  previous.status != current.status,
              builder: (context, state) {
                switch (state.status) {
                  case NetworkStatus.initial:
                  case NetworkStatus.loading:
                    return Stack(
                      children: [
                        AddToCartMainContent(
                          formBloc: formBloc,
                          product: widget.product,
                          productItemsSelectedCount: cartBloc.productItemsCount(
                            productId: widget.product.id,
                          ),
                          deviceWidth: deviceWidth,
                          horizontalPadding: horizontalPadding,
                        ),
                        if (state.status.isLoading)
                          const Positioned.fill(
                            child: AbsorbPointer(
                              child: ColoredBox(
                                color: Color.fromARGB(185, 255, 255, 255),
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            ),
                          ),
                      ],
                    );
                  case NetworkStatus.success:
                    return Stack(
                      children: [
                        AddToCartMainContent(
                          formBloc: formBloc,
                          product: widget.product,
                          productItemsSelectedCount: cartBloc.productItemsCount(
                            productId: widget.product.id,
                          ),
                          deviceWidth: deviceWidth,
                          horizontalPadding: horizontalPadding,
                        ),
                        if (showSuccessMessage)
                          const AddToCartSuccessResultContent(
                            horizontalPadding: horizontalPadding,
                          ),
                      ],
                    );
                  case NetworkStatus.failure:
                    return const AddToCartFailureResultContent(
                      horizontalPadding: horizontalPadding,
                    );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
