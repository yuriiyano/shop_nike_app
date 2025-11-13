import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shop_nike_app/screens/login/widgets/index.dart';
import 'package:shop_nike_app/widgets/index.dart';
import '../login_form_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final FocusNode _usernameFocusNode;
  late final FocusNode _passwordFocusNode;

  @override
  void initState() {
    super.initState();

    _usernameFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formBloc = context.read<LoginFormBloc>();

    return Column(
      children: <Widget>[
        TextInputFormBuilder(
          key: const Key('username'),
          fieldBloc: formBloc.username,
          label: 'Username',
          hintText: 'Username',
          textInputAction: TextInputAction.next,
          fieldFocusNode: _usernameFocusNode,
          nextFieldFocusNode: _passwordFocusNode,
        ),
        const SizedBox(height: 8),
        TextInputFormBuilder(
          key: const Key('password'),
          fieldBloc: formBloc.password,
          label: 'Password',
          hintText: 'Password',
          isObscureText: true,
          textInputAction: TextInputAction.done,
          fieldFocusNode: _passwordFocusNode,
          onSubmit: () {
            _passwordFocusNode.unfocus();
          },
        ),
        const SizedBox(height: 36),
        LoginButton(onPressed: formBloc.submit),
      ],
    );
  }
}
