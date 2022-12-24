import 'package:flutter/material.dart';
import 'package:watertraker/style.dart';

class OnBoardingSex extends StatelessWidget {
  const OnBoardingSex({
    Key? key,
  }) : super(key: key);

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
              Row(children: const [
                Text('Пол', style: MyStyle.styleText),
              ]),
              const SizedBox(height: 6),
              MyToggleButton('Мужской', 'Женский',
                  height: 32, width: 154, borderWidth: 12),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Вес', style: MyStyle.styleText),
                  MyToggleButton('кг', 'фн'),
                ],
              ),
              const SizedBox(height: 8),
              MySlider(150),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Рост', style: MyStyle.styleText),
                  MyToggleButton('см', 'фт'),
                ],
              ),
              const SizedBox(height: 8),
              MySlider(220),
              const SizedBox(height: 32),
              Row(children: const [
                Text('Возраст', style: MyStyle.styleText),
                SizedBox(width: 134),
              ]),
              const SizedBox(height: 8),
              MySlider(100),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xff33E34F)),
                  minimumSize: const MaterialStatePropertyAll(Size(342, 70)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  )),
                ),
                child: const Text('Продолжить', style: MyStyle.styleText),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TwoPage extends StatelessWidget {
  const TwoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [Text('data')],
      )),
    );
  }
}

// ignore: must_be_immutable
class MySlider extends StatefulWidget {
  MySlider(this.max, {super.key});
  double max;

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  double _currentValue = 0;
  @override
  Widget build(BuildContext context) {
    return Slider(
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
    );
  }
}

// ignore: must_be_immutable
class MyToggleButton extends StatefulWidget {
  MyToggleButton(this.nameOne, this.nameTwo,
      {super.key, this.width = 62, this.height = 32, this.borderWidth = 0});

  String nameOne;
  String nameTwo;
  int? height;
  int? width;
  int borderWidth;

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
        Container(
          width: widget.width?.toDouble(),
          height: widget.height?.toDouble(),
          alignment: Alignment.center,
          child: Text(
            widget.nameOne,
            style: const TextStyle(
                fontFamily: 'Monts', fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          width: widget.width?.toDouble(),
          height: widget.height?.toDouble(),
          alignment: Alignment.center,
          child: Text(
            widget.nameTwo,
            style: const TextStyle(
                fontFamily: 'Monts', fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
