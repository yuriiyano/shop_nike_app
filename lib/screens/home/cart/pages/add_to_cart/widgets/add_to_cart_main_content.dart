import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stx_flutter_form_bloc/stx_flutter_form_bloc.dart';

import 'package:shop_nike_app/models/index.dart';
import 'package:shop_nike_app/styles/index.dart';
import 'package:shop_nike_app/widgets/index.dart';
import 'package:shop_nike_app/screens/home/cart/widgets/index.dart';
import '../add_to_cart_bloc.dart';

class AddToCartMainContent extends StatelessWidget {
  const AddToCartMainContent({
    super.key,
    required this.formBloc,
    required this.product,
    required this.productItemsSelectedCount,
    required this.deviceWidth,
    required this.horizontalPadding,
  });

  final AddToCartBloc formBloc;
  final Product product;
  final int productItemsSelectedCount;

  final double deviceWidth;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
          ),
          child: CartProductInfo(
            product: product,
          ),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Items count:',
                style: TextStyle(
                  fontFamily: FontFamily.heebo,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                width: deviceWidth * 0.4,
                child: NumberPickerFormBuilder(
                  fieldBloc: formBloc.itemsCount,
                  valueValidator: (int newValue) {
                    if (newValue <= 0) return false;

                    var finalSelectedCount = newValue;
                    if (!formBloc.isEditing) {
                      finalSelectedCount += productItemsSelectedCount;
                    }

                    final allowedRange =
                        formBloc.itemsCount.extraData as NumberRange;
                    return finalSelectedCount >= allowedRange.min &&
                        finalSelectedCount <= allowedRange.max;
                  },
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
          ),
          child: BlocSelector<NumberFieldBloc, NumberFieldBlocState, bool>(
            bloc: formBloc.itemsCount,
            selector: (state) {
              return state.value != state.initialValue;
            },
            builder: (context, valueChanged) {
              final inactiveButton = formBloc.isEditing && !valueChanged;

              return CustomOutlinedButton(
                text: formBloc.isEditing ? 'Change Count' : 'Add to Bag',
                onPressed: inactiveButton ? () {} : formBloc.submit,
                width: double.infinity,
                backgroundColor: inactiveButton
                    ? const Color.fromARGB(255, 188, 188, 188)
                    : Colors.black,
              );
            },
          ),
        ),
      ],
    );
  }
}
