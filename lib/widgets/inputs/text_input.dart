import 'package:flutter/material.dart';

import 'package:shop_nike_app/styles/index.dart';

class TextInput extends StatefulWidget {
  final TextEditingController controller;

  final String label;
  final bool isObscureText;
  final String? hintText;
  final bool autocorrect;
  final TextInputAction? textInputAction;

  final FocusNode? fieldFocusNode;
  final FocusNode? nextFieldFocusNode;

  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;

  final String? errorText;
  final String? helperText;
  final int errorMaxLines;
  final int helperMaxLines;

  const TextInput({
    super.key,
    required this.controller,
    required this.label,
    required this.isObscureText,
    this.hintText,
    this.autocorrect = false,
    this.textInputAction,
    this.fieldFocusNode,
    this.nextFieldFocusNode,
    this.onChanged,
    this.onSubmitted,
    this.errorText,
    this.helperText,
    this.errorMaxLines = 1,
    this.helperMaxLines = 1,
  });

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  late bool _isObscureTextDynamic;

  @override
  void initState() {
    _isObscureTextDynamic = widget.isObscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const textInputMainColor = Color.fromARGB(255, 118, 118, 118);

    return Column(
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
          controller: widget.controller,
          obscureText: _isObscureTextDynamic,
          autocorrect: widget.autocorrect,
          textInputAction: widget.textInputAction,
          focusNode: widget.fieldFocusNode,
          onChanged: widget.onChanged,
          onSubmitted: widget.onSubmitted,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: widget.hintText != null
                ? const TextStyle(
                    color: textInputMainColor,
                    fontSize: 16,
                    letterSpacing: 0,
                    fontFamily: FontFamily.lato,
                    fontWeight: FontWeight.w400,
                  )
                : null,
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              borderSide: BorderSide(
                color: textInputMainColor,
              ),
            ),
            errorText: widget.errorText,
            helperText: widget.helperText,
            errorMaxLines: widget.errorText != null
                ? widget.errorMaxLines
                : null,
            helperMaxLines: widget.helperText != null
                ? widget.helperMaxLines
                : null,
            errorStyle: widget.errorText != null ? AppTextStyles.error : null,
            helperStyle: widget.helperText != null ? AppTextStyles.error : null,
            suffixIconColor: widget.isObscureText ? Colors.black : null,
            suffixIcon: widget.isObscureText
                ? IconButton(
                    icon: Icon(
                      _isObscureTextDynamic
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () => setState(
                      () => _isObscureTextDynamic = !_isObscureTextDynamic,
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
