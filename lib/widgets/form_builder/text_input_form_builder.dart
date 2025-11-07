import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stx_flutter_form_bloc/stx_flutter_form_bloc.dart';

import 'package:shop_nike_app/styles/index.dart';

class TextInputFormBuilder extends StatefulWidget {
  const TextInputFormBuilder({
    super.key,
    this.label = '',
    this.hintText,
    this.isObscureText = false,
    this.fieldFocusNode,
    this.nextFieldFocusNode,
    this.onSubmit,
    required this.fieldBloc,
  });

  final String label;
  final String? hintText;
  final bool isObscureText;
  final FocusNode? fieldFocusNode;
  final FocusNode? nextFieldFocusNode;
  final VoidCallback? onSubmit;
  final TextFieldBloc fieldBloc;

  @override
  State<TextInputFormBuilder> createState() => _TextInputFormBuilderState();
}

class _TextInputFormBuilderState extends State<TextInputFormBuilder> {
  late final TextEditingController _controller;

  late bool _isObscureTextDynamic;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.fieldBloc.value);
    _isObscureTextDynamic = widget.isObscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const textInputMainColor = Color.fromARGB(255, 118, 118, 118);

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.label,
                style: const TextStyle(
                  color: textInputMainColor,
                  fontSize: 12,
                  letterSpacing: 0,
                  fontFamily: FontFamily.lato,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 7),
              TextField(
                controller: _controller,
                autocorrect: false,
                textInputAction: TextInputAction.next,
                focusNode: widget.fieldFocusNode,
                obscureText: _isObscureTextDynamic,
                onChanged: (value) => widget.fieldBloc.changeValue(value),
                onSubmitted: (value) {
                  widget.nextFieldFocusNode?.requestFocus();
                  widget.onSubmit?.call();
                },

                decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: const TextStyle(
                    color: textInputMainColor,
                    fontSize: 16,
                    letterSpacing: 0,
                    fontFamily: FontFamily.lato,
                    fontWeight: FontWeight.w400,
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    borderSide: BorderSide(
                      color: textInputMainColor,
                    ),
                  ),
                  errorText: state.displayError,
                  helperText: '',
                  helperMaxLines: 1,
                  errorMaxLines: 1,
                  helperStyle: AppTextStyles.error,
                  errorStyle: AppTextStyles.error,
                  suffixIconColor: widget.isObscureText ? Colors.black : null,
                  suffixIcon: widget.isObscureText
                      ? IconButton(
                          icon: Icon(
                            _isObscureTextDynamic
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () => setState(
                            () =>
                                _isObscureTextDynamic = !_isObscureTextDynamic,
                          ),
                        )
                      : null,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
