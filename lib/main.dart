import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:watertraker/features/account/presentation/pages/page_acc.dart';

import 'package:watertraker/features/onboarding/presentation/pages/splash_page.dart';

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
          '/second': (context) => PageAccount(
                onPressed: () {},
              ),
        },
      ),
    );
  }
}

class ToggleProvider extends ChangeNotifier {
  double weightTextProvider = 4;
  double heightTextProvider = 40;
  double ageProvider = 1;
  double valueMax = 0;
  double currentValue = 0;
  late List<bool> switcherHorizont;

  double convertCurrentValue(double a) {
    return currentValue = a;
    notifyListeners();
  }

  void convertValueMax(double a) {
    valueMax = a;
    notifyListeners();
  }

  void convertWeight(double a) {
    weightTextProvider = a;
    notifyListeners();
  }

  void convertHeight(double a) {
    heightTextProvider = a;
    notifyListeners();
  }

  void convertAge(double a) {
    ageProvider = a;
    notifyListeners();
  }

  void recalculation() {
    weightTextProvider = weightTextProvider * 2.2;
    heightTextProvider = heightTextProvider * 0.033;
    notifyListeners();
  }
}
