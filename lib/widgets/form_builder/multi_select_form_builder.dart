import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stx_flutter_form_bloc/stx_flutter_form_bloc.dart';

class MultiSelectFormBuilder<ValueType> extends StatelessWidget {
  const MultiSelectFormBuilder({
    super.key,
    required this.fieldBloc,
    required this.optionLabel,
  });

  final MultiSelectFieldBloc<ValueType> fieldBloc;
  final String Function(ValueType) optionLabel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      MultiSelectFieldBloc<ValueType>,
      MultiSelectFieldBlocState<ValueType>
    >(
      bloc: fieldBloc,
      builder: (context, state) {
        return Column(
          children: fieldBloc.options.map((selectOption) {
            return CheckboxListTile(
              value: state.value.contains(selectOption),
              title: Text(optionLabel(selectOption)),

              onChanged: (selected) {
                if (selected!) {
                  fieldBloc.selectValue(selectOption);
                } else {
                  fieldBloc.deselectValue(selectOption);
                }
              },
              controlAffinity: ListTileControlAffinity.leading,
            );
          }).toList(),
        );
      },
    );
  }
}
