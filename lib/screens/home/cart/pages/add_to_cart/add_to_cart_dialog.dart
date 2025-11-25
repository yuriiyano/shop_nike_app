import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stx_flutter_form_bloc/stx_flutter_form_bloc.dart';

import 'package:shop_nike_app/models/index.dart';
import 'package:shop_nike_app/services/index.dart';
import 'package:shop_nike_app/blocs/index.dart';
import 'package:shop_nike_app/router/index.dart';
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

  void showSuccessTemporarily() {
    setState(() => showSuccessMessage = true);
  }

  @override
  Widget build(BuildContext context) {
    const horizontalPadding = 24.0;
    final deviceWidth = MediaQuery.sizeOf(context).width;

    final formBloc = context.read<AddToCartBloc>();
    final cartBloc = context.read<CartBloc>();

    return FormBlocListener<AddToCartBloc, CartProduct, String>(
      onSuccess: (context, state) {
        if (formBloc.isEditing) {
          context.maybePop();
        } else {
          final productCountIncreased =
              state.response!.cartCount > formBloc.itemsCount.value!;
          if (productCountIncreased) {
            context.maybePop();
          } else {
            showSuccessTemporarily();
          }
        }
        cartBloc.loadAsyncFuture();
      },

      child: SafeArea(
        top: false,
        child: Stack(
          children: [
            BlocBuilder<AddToCartBloc, FormBlocState<CartProduct, String>>(
              bloc: formBloc,
              buildWhen: (previous, current) =>
                  previous.status != current.status,
              builder: (context, state) {
                switch (state.status) {
                  case FormStatus.initial:
                  case FormStatus.success:
                  case FormStatus.loading:
                  case FormStatus.valid:
                  case FormStatus.invalid:
                    return Stack(
                      children: [
                        AddToCartMainContent(
                          formBloc: formBloc,
                          product: widget.product,
                          productItemsSelectedCount: cartBloc.state
                              .productItemsCount(
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
                        if (state.status.isSuccess && showSuccessMessage)
                          const AddToCartSuccessResultContent(
                            horizontalPadding: horizontalPadding,
                          ),
                      ],
                    );
                  case FormStatus.failure:
                    return const AddToCartFailureResultContent(
                      horizontalPadding: horizontalPadding,
                    );
                  case FormStatus.cancelled: 
                    return const SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
