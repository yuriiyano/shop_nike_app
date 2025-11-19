import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stx_flutter_form_bloc/stx_flutter_form_bloc.dart';

import 'package:shop_nike_app/widgets/inputs/index.dart';

class TextInputFormBuilder extends StatefulWidget {
  const TextInputFormBuilder({
    super.key,
    required this.fieldBloc,
    this.label = '',
    this.hintText,
    this.isObscureText = false,
    this.textInputAction,
    this.textInputType,
    this.enableInteractiveSelection,
    this.fieldFocusNode,
    this.nextFieldFocusNode,
    this.onSubmit,
  });

  final TextFieldBloc fieldBloc;
  final String label;
  final String? hintText;
  final bool isObscureText;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final bool? enableInteractiveSelection;
  final FocusNode? fieldFocusNode;
  final FocusNode? nextFieldFocusNode;
  final VoidCallback? onSubmit;

  @override
  State<TextInputFormBuilder> createState() => _TextInputFormBuilderState();
}

class _TextInputFormBuilderState extends State<TextInputFormBuilder> {
  late final TextEditingController _controller;

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
        if (_controller.text != state.value) {
          final previousSelection = _controller.selection;

          final offset = min(
            previousSelection.baseOffset,
            state.toString().length,
          );

          _controller
            ..text = state.toString()
            ..selection = previousSelection.copyWith(
              baseOffset: offset,
              extentOffset: offset,
            );
        }

        return Focus(
          onFocusChange: (value) {
            if (!value) {
              widget.fieldBloc.focusChanged();
            }
          },
          child: TextInput(
            controller: _controller,
            label: widget.label,
            isObscureText: widget.isObscureText,
            hintText: widget.hintText,
            textInputAction: widget.textInputAction,
            textInputType: widget.textInputType,
            enableInteractiveSelection: widget.enableInteractiveSelection,
            fieldFocusNode: widget.fieldFocusNode,
            nextFieldFocusNode: widget.nextFieldFocusNode,
            onChanged: (value) => widget.fieldBloc.changeValue(value),
            onSubmitted: (value) {
              widget.nextFieldFocusNode?.requestFocus();
              widget.onSubmit?.call();
            },
            errorText: state.displayError,
          ),
        );
      },
    );
  }
}
