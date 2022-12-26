import 'package:flutter/material.dart';
import 'package:watertraker/pages/onboarding_sex_page.dart';

import '../utils/style.dart';

class OnBoardingSportPage extends StatefulWidget {
  OnBoardingSportPage({
    super.key,
    required this.onPressed,
  });

  VoidCallback onPressed;
  @override
  State<OnBoardingSportPage> createState() => _OnBoardingSportPageState();
}

class _OnBoardingSportPageState extends State<OnBoardingSportPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: [
                  const SizedBox(width: 18),
                  Text('Как часто \nтренируетесь?', style: MyStyle.styleText),
                ],
              ),
              const SizedBox(height: 12),
              MyContainer(
                child: const MyToggleButton(
                  nameOne: 'Редко',
                  nameTwo: 'Два, три раза в неделю',
                  nameThree: 'Ежеденевно',
                  axisHorizontal: false,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const SizedBox(width: 18),
                  Text('Как часто \nтренируетесь?', style: MyStyle.styleText),
                ],
              ),
              const SizedBox(height: 12),
              MyContainer(
                child: const MyToggleButton(
                  nameOne: 'Никогда',
                  nameTwo: 'Редко',
                  nameThree: 'Часто',
                  axisHorizontal: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
