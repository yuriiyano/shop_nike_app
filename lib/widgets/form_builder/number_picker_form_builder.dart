import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stx_flutter_form_bloc/stx_flutter_form_bloc.dart';

import 'package:shop_nike_app/screens/home/cart/pages/add_to_cart/add_to_cart_bloc.dart';
import 'package:shop_nike_app/widgets/inputs/index.dart';

class NumberPickerFormBuilder extends StatelessWidget {
  const NumberPickerFormBuilder({
    super.key,
    required this.fieldBloc,
    required this.productItemsSelectedCount,
    required this.isEditing,
  });

  final NumberFieldBloc fieldBloc;
  final int productItemsSelectedCount;
  final bool isEditing;

  bool mayChangeValue(int newValue) {
    if (newValue <= 0) return false;

    var finalSelectedCount = newValue;
    if (!isEditing) {
      finalSelectedCount += productItemsSelectedCount;
    }
    
    final allowedRange = fieldBloc.extraData as NumberRange;
    return finalSelectedCount >= allowedRange.min &&
        finalSelectedCount <= allowedRange.max;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NumberFieldBloc, NumberFieldBlocState>(
      bloc: fieldBloc,
      builder: (context, state) {
        return NumberPicker(
          number: state.value!,
          onValueChange: (int value) {
            final newValue = state.value! + value;

            if (mayChangeValue(newValue)) {
              fieldBloc.changeValue(newValue);
            }
          },
        );
      },
    );
  }
}
