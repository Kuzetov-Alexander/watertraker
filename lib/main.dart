import 'package:flutter/material.dart';
import 'package:watertraker/pages/onboarding_sex.dart';
import 'package:watertraker/pages/splash.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Splash(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  late final PageController controller;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children: [
        OnBoardingSex(
          onPressed: () {
            controller.animateToPage(1,
                duration: const Duration(milliseconds: 1000),
                curve: Curves.decelerate);
          },
        ),
        SizedBox(
          child: Column(
            children: const [
              SizedBox(height: 200),
              SizedBox(height: 200),
              SizedBox(height: 200),
              Center(child: Text('data')),
            ],
          ),
        )
      ],
    );
  }
}
