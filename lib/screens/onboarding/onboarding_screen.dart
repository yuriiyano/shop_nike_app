import 'package:flutter/material.dart';

import 'package:auto_route/annotations.dart';
import 'package:provider/provider.dart';

import 'package:shop_nike_app/blocs/index.dart';
import 'package:shop_nike_app/styles/index.dart';
import 'package:shop_nike_app/widgets/index.dart';

@RoutePage()
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.sizeOf(context).height <= 670;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Assets.images.onboardingBackground.image(
            fit: BoxFit.cover,
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
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Assets.images.logo.svg(),
                  SizedBox(height: isSmallScreen ? 16 : 48),
                  Text(
                    'Nike App\nBringing Nike Members the best products, inspiration and stories in sport.',
                    style: TextStyle(
                      fontFamily: FontFamily.helveticaNowText,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: isSmallScreen ? 28 : 32,
                    ),
                  ),
                  SizedBox(height: isSmallScreen ? 14 : 24),
                  CustomOutlinedButton(
                    text: 'Sign In',
                    width: double.infinity,
                    onPressed: () {
                      context.read<AuthBloc>().add(
                        const AuthEvent.finishOnboarding(),
                      );
                    },
                  ),
                  SizedBox(height: isSmallScreen ? 60 : 100),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
