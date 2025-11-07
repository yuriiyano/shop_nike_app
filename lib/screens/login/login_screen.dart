import 'dart:math';

import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shop_nike_app/services/index.dart';
import 'package:shop_nike_app/styles/index.dart';
import 'package:shop_nike_app/widgets/index.dart';
import 'login_form_bloc.dart';
import 'widgets/index.dart';

@RoutePage()
class LoginScreen extends StatelessWidget implements AutoRouteWrapper {
  const LoginScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginFormBloc>(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final isSmallScreen = screenSize.height <= 670;

    return CustomFormBlocListener(
      formBloc: context.read<LoginFormBloc>(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          width: double.infinity,
          color: Colors.white,
          child: SingleChildScrollView(
            child: SizedBox(
              height: max(screenSize.height, 600),
              child: Padding(
                padding: EdgeInsets.only(top: isSmallScreen ? 100 : 138),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 36),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Assets.images.logo.svg(
                              width: 50,
                              height: 18,
                              colorFilter: const ColorFilter.mode(
                                Colors.black,
                                BlendMode.srcIn,
                              ),
                            ),
                            const SizedBox(height: 32),
                            const Text(
                              'Sign in',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 28,
                                letterSpacing: -1,
                                fontFamily: FontFamily.lato,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 40),
                            const LoginForm(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
