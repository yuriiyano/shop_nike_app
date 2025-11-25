import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stx_flutter_form_bloc/stx_flutter_form_bloc.dart';

import 'package:shop_nike_app/widgets/inputs/index.dart';

class NumberPickerFormBuilder extends StatelessWidget {
  const NumberPickerFormBuilder({
    super.key,
    required this.fieldBloc,
    this.valueValidator,
  });

  final NumberFieldBloc fieldBloc;
  final bool Function(int)? valueValidator;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NumberFieldBloc, NumberFieldBlocState>(
      bloc: fieldBloc,
      builder: (context, state) {
        return NumberPicker(
          number: state.value!,
          onValueChange: (int stepValue) {
            final newValue = state.value! + stepValue;

            if (valueValidator?.call(newValue) ?? false) {
              fieldBloc.changeValue(newValue);
            }
          },
        );
      },
    );
  }
}
