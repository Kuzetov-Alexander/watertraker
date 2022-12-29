import 'package:flutter/material.dart';
import 'package:watertraker/features/onboarding/presentation/pages/splash_page.dart';

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
