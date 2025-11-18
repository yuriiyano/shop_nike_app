import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stx_flutter_form_bloc/stx_flutter_form_bloc.dart';

class RadioSelectFormBuilder<ValueType> extends StatelessWidget {
  const RadioSelectFormBuilder({
    super.key,
    required this.fieldBloc,
    required this.optionLabel,
  });

  final SelectFieldBloc<ValueType> fieldBloc;
  final String Function(ValueType) optionLabel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      SelectFieldBloc<ValueType>,
      SelectFieldBlocState<ValueType>
    >(
      bloc: fieldBloc,
      builder: (context, state) {
        return RadioGroup(
          groupValue: fieldBloc.value,
          onChanged: fieldBloc.changeValue,
          child: Column(
            children: fieldBloc.options.map((selectOption) {
              return RadioListTile(
                title: Text(optionLabel(selectOption)),
                value: selectOption,
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
