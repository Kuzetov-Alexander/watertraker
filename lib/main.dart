import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watertraker/features/account/presentation/pages/account_page.dart';
import 'package:watertraker/features/onboarding/presentation/pages/splash_page.dart';

// Это
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ToggleProvider(),
        ),
      ],
      child: MaterialApp(
        initialRoute: '',
        routes: {
          '/': (context) => const SplashPage(),
          '/second': (context) => AccountPage(onPressed: () {}),
        },
      ),
    );
  }
}

class ToggleProvider extends ChangeNotifier {
  double weightText = 4;
  double heightText = 40;
  double age = 1;
  // double valueProvider = 0;

  void recalculation() {
    weightText = weightText * 2.2;
    heightText = heightText * 0.033;

    notifyListeners();
  }
}
