import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:watertraker/features/onboarding/manager/toggle_provider.dart';
import 'package:watertraker/features/onboarding/presentation/widgets/create_slider.dart';
import 'package:watertraker/features/onboarding/presentation/widgets/myslider.dart';

import 'package:watertraker/features/onboarding/presentation/widgets/toggle_button.dart';
import 'package:watertraker/utils/style.dart';

// <name_widget>_page.dart -> <NameWidget>Page

class OnBoardingSexPage extends StatefulWidget {
  const OnBoardingSexPage({
    required this.onPressed,
    super.key,
  });

  final VoidCallback onPressed;

  @override
  State<OnBoardingSexPage> createState() => _OnBoardingSexPageState();
}

class _OnBoardingSexPageState extends State<OnBoardingSexPage> {
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
              children: <Widget>[
                Row(
                  children: [
                    const SizedBox(width: 18),
                    Text('Пол', style: MyStyle.styleText),
                  ],
                ),
                const SizedBox(height: 10),
                MyContainer(
                  child: MyToggleButton(
                    alignment: ToggleAlignment.horizontal,
                    height: 47,
                    listData: context
                        .watch<ToggleProvider>()
                        .toggleSex
                        .map(
                          (e) => ToggleData(
                            name: e.value.value,
                            isDefault: e.active,
                          ),
                        )
                        .toList(),
                    onPresseds: (value) {
                      context
                          .read<ToggleProvider>()
                          .changedToggleSex(Sex.fromValue(value.name));
                    },
                  ),
                ),
                const SizedBox(height: 27),
                Padding(
                  padding: const EdgeInsets.only(right: 8, left: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Вес', style: MyStyle.styleText),
                      SizedBox(
                        width: 136,
                        child: MyToggleButton(
                          alignment: ToggleAlignment.horizontal,
                          width: 62,
                          listData: context
                              .watch<ToggleProvider>()
                              .toggleWeightUnit
                              .map(
                                (e) => ToggleData(
                                  name: e.value.value,
                                  isDefault: e.active,
                                ),
                              )
                              .toList(),
                          onPresseds: (value) {
                            context
                                .read<ToggleProvider>()
                                .changedToggleWeightUnit(
                                  WeightUnit.fromValue(value.name),
                                );
                            context.read<ToggleProvider>().recalculation();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                MyContainer(
                  data: Provider.of<ToggleProvider>(context)
                      .weight
                      .toStringAsFixed(0),
                  child: Builder(
                    builder: (context) {
                      final provider = Provider.of<ToggleProvider>(context);
                      return MySl(
                        max: provider.weightMax,
                        onChanged: (value) {
                          provider.weightValue =
                              provider.weightValue.copyWith(value: value);
                        },
                        value: provider.weight,
                      );
                    },
                  ),
                  // MySlider(
                  //   150,
                  //   onChanged: (value) {
                  //     setState(() {
                  //       Provider.of<ToggleProvider>(context, listen: false)
                  //           .convertWeight(value);
                  //     });
                  //   },
                  // ),
                ),
                const SizedBox(height: 27),
                Padding(
                  padding: const EdgeInsets.only(right: 8, left: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Рост', style: MyStyle.styleText),
                      SizedBox(
                        width: 136,
                        child: MyToggleButton(
                          alignment: ToggleAlignment.horizontal,
                          width: 62,
                          listData: context
                              .watch<ToggleProvider>()
                              .toggleHeightUnit
                              .map(
                                (e) => ToggleData(
                                  name: e.value.value,
                                  isDefault: e.active,
                                ),
                              )
                              .toList(),
                          onPresseds: (value) {
                            context
                                .read<ToggleProvider>()
                                .changedToggleHeightUnit(
                                  HeightUnit.fromValue(value.name),
                                );
                          },
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                MyContainer(
                  data: Provider.of<ToggleProvider>(context)
                      .heightTextProvider
                      .toDouble()
                      .toInt()
                      .toString(),
                  child: MySlider(
                    220,
                    onChanged: (value) {
                      setState(() {
                        Provider.of<ToggleProvider>(context, listen: false)
                            .convertHeight(value);
                      });
                    },
                  ),
                ),
                const SizedBox(height: 27),
                Row(
                  children: [
                    const SizedBox(width: 18),
                    Text('Возраст', style: MyStyle.styleText),
                  ],
                ),
                const SizedBox(height: 8),
                MyContainer(
                  data: Provider.of<ToggleProvider>(context)
                      .ageProvider
                      .toDouble()
                      .toInt()
                      .toString(),
                  child: MySlider(
                    100,
                    onChanged: (value) {
                      setState(() {
                        Provider.of<ToggleProvider>(context, listen: false)
                            .convertAge(value);
                      });
                    },
                  ),
                ),
                const SizedBox(height: 27),
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
                const SizedBox(height: 27),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
