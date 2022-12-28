import 'package:flutter/material.dart';
import 'package:watertraker/pages/onboarding_notification.dart';
import 'package:watertraker/pages/onboarding_sex_page.dart';
import 'package:watertraker/pages/splash_page.dart';

import 'pages/onboardind_sport_page.dart';

// Это
void main() {
  runApp(const MyApp());
}

// Это
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '',
      routes: {
        '/': (context) => const SplashPage(),
        // '/second': (context) => OnBoardingSexPage()
      },
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children: [
        OnBoardingSexPage(
          onPressed: () {
            controller.animateToPage(
              1,
              duration: const Duration(milliseconds: 2000),
              curve: Curves.decelerate,
            );
          },
        ),
        OnBoardingSportPage(
          onPressed: () {
            controller.animateToPage(
              2,
              duration: const Duration(milliseconds: 2000),
              curve: Curves.decelerate,
            );
          },
        ),
        OnBoardingNotificationPage(
          onPressed: () {
            controller.animateToPage(
              1,
              duration: const Duration(milliseconds: 2000),
              curve: Curves.decelerate,
            );
          },
        ),
      ],
    );
  }
}
