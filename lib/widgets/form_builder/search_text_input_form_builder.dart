import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stx_flutter_form_bloc/stx_flutter_form_bloc.dart';

import 'package:shop_nike_app/widgets/inputs/index.dart';

class SearchTextInputFormBuilder extends StatefulWidget {
  const SearchTextInputFormBuilder({super.key, required this.fieldBloc});

  final TextFieldBloc fieldBloc;

  @override
  State<SearchTextInputFormBuilder> createState() =>
      _SearchTextInputFormBuilderState();
}

class _SearchTextInputFormBuilderState
    extends State<SearchTextInputFormBuilder> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.fieldBloc.value);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextFieldBloc, TextFieldBlocState>(
      bloc: widget.fieldBloc,
      builder: (context, state) {
        return SearchTextInput(
          controller: _controller,
          hintText: 'Enter product name',
          onChanged: (value) {
            widget.fieldBloc.changeValue(value);
          },
        );
      },
    );
  }
}
