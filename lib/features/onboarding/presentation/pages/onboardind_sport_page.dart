import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:watertraker/features/onboarding/manager/toggle_provider.dart';
import 'package:watertraker/features/onboarding/presentation/widgets/toggle_button.dart';

import '../../../../utils/style.dart';

class OnBoardingSportPage extends StatefulWidget {
  const OnBoardingSportPage({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  State<OnBoardingSportPage> createState() => _OnBoardingSportPageState();
}

class _OnBoardingSportPageState extends State<OnBoardingSportPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    const SizedBox(width: 18),
                    Text('Как часто \nтренируетесь?', style: MyStyle.styleText),
                  ],
                ),
                const SizedBox(height: 12),
                MyContainer(
                  child: MyToggleButton(
                    height: 67,
                    alignment: ToggleAlignment.vertical,
                    listData: context
                        .watch<ToggleProvider>()
                        .questionSport
                        .map(
                          (e) => ToggleData(
                            name: e.value.value,
                            isDefault: e.active,
                          ),
                        )
                        .toList(),
                    onPresseds: (value) {
                      context.read<ToggleProvider>().changedQuestionSport(
                            QuestionSport.fromValue(value.name),
                          );
                    },
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const SizedBox(width: 18),
                    Text('Кофе и энергетики?', style: MyStyle.styleText),
                  ],
                ),
                const SizedBox(height: 12),
                MyContainer(
                  child: MyToggleButton(
                    height: 67,
                    alignment: ToggleAlignment.vertical,
                    listData: context
                        .watch<ToggleProvider>()
                        .questionDrink
                        .map(
                          (e) => ToggleData(
                            name: e.value.value,
                            isDefault: e.active,
                          ),
                        )
                        .toList(),
                    onPresseds: (value) {
                      context.read<ToggleProvider>().changedQuestionDrink(
                            QuestionDrink.fromValue(value.name),
                          );
                    },
                  ),
                ),
                const SizedBox(height: 23),
                ElevatedButton(
                  onPressed: widget.onPressed,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xff33E34F)),
                    fixedSize: const MaterialStatePropertyAll(Size(342, 70)),
                    maximumSize: const MaterialStatePropertyAll(Size(342, 70)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  child: Text(
                    'Продолжить',
                    style: GoogleFonts.montserrat(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 21),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
