import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watertraker/utils/style.dart';

// <name_widget>_page.dart -> <NameWidget>Page
class OnBoardingSexPage extends StatelessWidget {
  const OnBoardingSexPage({
    required this.onPressed,
    super.key,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: [
                  const SizedBox(width: 18),
                  Text('Пол', style: MyStyle.styleText),
                ],
              ),
              const SizedBox(height: 6),
              const MyToggleButton(
                'Мужской',
                'Женский',
                height: 25,
                width: 154,
                borderWidth: 12,
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.only(right: 8, left: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Вес', style: MyStyle.styleText),
                    const MyToggleButton('кг', 'фн'),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              const MySlider(150),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.only(right: 8, left: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Рост', style: MyStyle.styleText),
                    const MyToggleButton('см', 'фт'),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              const MySlider(220),
              const SizedBox(height: 32),
              Row(
                children: [
                  const SizedBox(width: 18),
                  Text('Возраст', style: MyStyle.styleText),
                ],
              ),
              const SizedBox(height: 8),
              const MySlider(100),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: onPressed,
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
                child: Text('Продолжить', style: MyStyle.styleText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MySlider extends StatefulWidget {
  const MySlider(this.max, {super.key});

  final double max;

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  double _currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: 21,
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 0.0),
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 17.5),
        valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
      ),
      child: Slider(
        value: _currentValue,
        onChanged: (double value) {
          setState(() {
            _currentValue = value;
          });
        },
        activeColor: const Color(0xff0148FF),
        thumbColor: const Color(0xff0148FF),
        inactiveColor: Colors.grey.shade300,
        max: widget.max,
        divisions: widget.max.toInt(),
        label: _currentValue.round().toString(),
      ),
    );
  }
}

class MyToggleButton extends StatefulWidget {
  const MyToggleButton(
    this.nameOne,
    this.nameTwo, {
    super.key,
    this.width = 62,
    this.height = 25,
    this.borderWidth = 0,
  });

  final int borderWidth;
  final int height;
  final String nameOne;
  final String nameTwo;
  final int width;

  @override
  State<MyToggleButton> createState() => _MyToggleButtonState();
}

class _MyToggleButtonState extends State<MyToggleButton> {
  List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      fillColor: const Color(0xff0148FF),
      color: Colors.blue.shade200,
      selectedColor: Colors.white,
      borderWidth: widget.borderWidth.toDouble(),
      borderColor: Colors.grey.shade300,
      selectedBorderColor: Colors.grey.shade300,
      borderRadius: BorderRadius.circular(50),
      isSelected: isSelected,
      onPressed: (int index) {
        setState(() {
          for (int buttonIndex = 0;
              buttonIndex < isSelected.length;
              buttonIndex++) {
            if (buttonIndex == index) {
              isSelected[buttonIndex] = true;
            } else {
              isSelected[buttonIndex] = false;
            }
          }
        });
      },
      children: <Widget>[
        SizedBox(
          width: widget.width.toDouble(),
          height: widget.height.toDouble(),
          child: Text(
            widget.nameOne,
            style: GoogleFonts.montserrat(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          width: widget.width.toDouble(),
          height: widget.height.toDouble(),
          child: Text(
            widget.nameTwo,
            style: GoogleFonts.montserrat(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
