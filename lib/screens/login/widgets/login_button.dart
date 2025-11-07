import 'package:flutter/material.dart';

import 'package:shop_nike_app/widgets/buttons/index.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return
    CustomOutlinedButton(
      text: 'Next',
      onPressed: onPressed,
      backgroundColor: Colors.black,
      width: double.infinity,
    );
  }
}
