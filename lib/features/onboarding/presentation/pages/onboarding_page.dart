import 'package:flutter/material.dart';
import 'package:watertraker/features/onboarding/presentation/pages/onboardind_sport_page.dart';
import 'package:watertraker/features/onboarding/presentation/pages/onboarding_notification.dart';
import 'package:watertraker/features/onboarding/presentation/pages/onboarding_premium.dart';
import 'package:watertraker/features/onboarding/presentation/pages/onboarding_sex_page.dart';
import 'package:watertraker/features/onboarding/presentation/widgets/page_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final PageController controller;
  int currentPage = 0;
  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          PageView(
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            controller: controller,
            children: [
              OnBoardingSexPage(
                onPressed: () {
                  controller.animateToPage(
                    1,
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.decelerate,
                  );
                },
              ),
              OnBoardingSportPage(
                onPressed: () {
                  controller.animateToPage(
                    2,
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.decelerate,
                  );
                },
              ),
              OnBoardingNotificationPage(
                onPressed: () {
                  controller.animateToPage(
                    3,
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.decelerate,
                  );
                },
              ),
              OnboardingPremiumPage(
                onPressed: () {
                  controller.animateToPage(
                    2,
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.decelerate,
                  );
                },
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: PageIndicator(
              currentPage: currentPage,
            ),
          ),
        ],
      ),
    );
  }
}
