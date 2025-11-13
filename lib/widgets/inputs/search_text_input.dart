import 'package:flutter/material.dart';

import 'package:shop_nike_app/styles/index.dart';

class SearchTextInput extends StatelessWidget {
  const SearchTextInput({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onChanged,
  });

  final TextEditingController controller;
  final String hintText;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        suffixIcon: controller.text.isNotEmpty
            ? IconButton(
                onPressed: () {
                  onChanged('');
                  controller.clear();
                },
                icon: const Icon(
                  Icons.cancel_sharp,
                  color: Color.fromARGB(255, 186, 186, 186),
                  size: 25,
                ),
              )
            : null,
        suffixIconColor: Colors.black,
        hintText: hintText,
        hintStyle: const TextStyle(
          fontFamily: FontFamily.helveticaNowText,
          fontWeight: FontWeight.w400,
          fontSize: 18,
          color: Color.fromARGB(255, 118, 118, 118),
        ),
        border: InputBorder.none,
      ),
      onChanged: onChanged,
    );
  }
}
