import 'package:flutter/material.dart';
import 'package:watertraker/features/account/presentation/pages/account_page.dart';
import 'package:watertraker/features/account/presentation/pages/auth_page.dart';
import 'package:watertraker/features/account/presentation/pages/editing_account_page.dart';
import 'package:watertraker/features/account/presentation/pages/registr_page.dart';

class PageAccount extends StatefulWidget {
  const PageAccount({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  State<PageAccount> createState() => _PageAccountState();
}

class _PageAccountState extends State<PageAccount> {
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
      child: PageView(
        onPageChanged: (value) {
          setState(() {
            currentPage = value;
          });
        },
        controller: controller,
        children: [
          AccountPage(
            onPressed: () {
              controller.animateToPage(
                1,
                duration: const Duration(milliseconds: 1000),
                curve: Curves.decelerate,
              );
            },
          ),
          EditingAccountPage(
            onPressed: () {
              controller.animateToPage(
                2,
                duration: const Duration(milliseconds: 1000),
                curve: Curves.decelerate,
              );
            },
          ),
          AuthentificalPage(
            onPressed: () {
              controller.animateToPage(
                3,
                duration: const Duration(milliseconds: 1000),
                curve: Curves.decelerate,
              );
            },
          ),
          RegistrationPage(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AccountPage(
                    onPressed: () {},
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
