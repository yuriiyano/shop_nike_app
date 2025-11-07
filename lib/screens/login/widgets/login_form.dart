import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shop_nike_app/screens/login/widgets/index.dart';
import 'package:shop_nike_app/widgets/index.dart';
import '../login_form_bloc.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formBloc = context.read<LoginFormBloc>();

    return Column(
      children: <Widget>[
        TextInputFormBuilder(
          key: const Key('username'),
          label: 'Username',
          fieldBloc: formBloc.username,
          hintText: 'Username',
        ),
        const SizedBox(height: 7),
        TextInputFormBuilder(
          key: const Key('password'),
          isObscureText: true,
          label: 'Password',
          hintText: 'Password',
          fieldBloc: formBloc.password,
        ),
        const SizedBox(height: 36),
        LoginButton(
          onPressed: () => context.read<LoginFormBloc>().submit(),
        ),
      ],
    );
  }
}
