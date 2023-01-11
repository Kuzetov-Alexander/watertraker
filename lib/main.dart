import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:watertraker/features/account/presentation/pages/page_acc.dart';
import 'package:watertraker/features/onboarding/manager/toggle_provider.dart';

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
          create: (context) => ToggleProvider(
            Sex.values
                .map(
                  (e) => ToggleState(
                    active: e == Sex.male,
                    value: e,
                  ),
                )
                .toList(),
          ),
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
