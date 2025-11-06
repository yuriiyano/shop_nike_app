import 'package:flutter/material.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:shop_nike_app/blocs/index.dart';
import 'package:shop_nike_app/styles/index.dart';
import 'package:shop_nike_app/widgets/index.dart';

@RoutePage()
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Assets.images.onboardingBackground.image(
            fit: BoxFit.contain,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black,
                  Colors.black,
                  Colors.transparent,
                  Colors.black,
                  Colors.black,
                ],
                stops: [0, 0.01, 0.5, 0.99, 1],
              ),
            ),
          ),
          Column(
            children: [
              const Spacer(),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Assets.images.logo.svg(),
                        const SizedBox(height: 48),
                        const Text(
                          'Nike App\nBringing Nike Members the best products, inspiration and stories in sport.',
                          style: TextStyle(
                            fontFamily: FontFamily.helveticaNowText,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 32,
                          ),
                        ),
                        const SizedBox(height: 24),
                        CustomOutlinedButton(
                          text: 'Sign In',
                          width: double.infinity,
                          onPressed: () {
                            context.read<AuthBloc>().add(
                              const AuthEvent.finishOnboarding(),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
