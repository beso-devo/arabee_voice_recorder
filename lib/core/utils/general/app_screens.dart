import 'package:flutter/material.dart';
import 'package:arabee_voice_recorder/features/onboarding_feature/presentation/pages/on_boarding_page.dart';

class ScreenGenerator {
  static Route<dynamic> onGenerate(RouteSettings value) {
    String? name = value.name;
    print("the name is $name");
    final args = value.arguments;
    switch (name) {
      case AppScreens.onBoardingPage:
        return MaterialPageRoute(builder: (context) => const OnBoardingPage());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: const Center(
            child: Text('ERROR'),
          ),
        );
      },
    );
  }
}

class AppScreens {
  static const String onBoardingPage = "/";
  static const String signInPage = "/sign_in_page";
  static const String signUpPage = "/sign_up_page";
}

