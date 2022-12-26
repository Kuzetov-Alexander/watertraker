import 'package:flutter/material.dart';
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
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
              const SizedBox(height: 10),
              MyContainer(
                child: const MyToggleButton(
                  nameOne: 'Мужской',
                  nameTwo: 'Женский',
                  widht: 154,
                  height: 43,
                ),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.only(right: 8, left: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Вес', style: MyStyle.styleText),
                    const MyToggleButton(nameOne: 'кг', nameTwo: 'фн')
                  ],
                ),
              ),
              const SizedBox(height: 8),
              MyContainer(child: const MySlider(150)),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.only(right: 8, left: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Рост', style: MyStyle.styleText),
                    const MyToggleButton(nameOne: 'см', nameTwo: 'фт'),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              MyContainer(child: const MySlider(220)),
              const SizedBox(height: 32),
              Row(
                children: [
                  const SizedBox(width: 18),
                  Text('Возраст', style: MyStyle.styleText),
                ],
              ),
              const SizedBox(height: 8),
              MyContainer(child: const MySlider(100)),
              const SizedBox(height: 32),
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
                child: Text('Продолжить', style: MyStyle.styleText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyContainer extends StatelessWidget {
  MyContainer({
    super.key,
    required this.child,
    this.windowOn = false,
    // this.value,
  });
  Widget child;
  bool windowOn;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(24.0),
          ),
        ),
        color: Colors.blue.shade100,
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Text(
            'value',
            style: MyStyle.styleTextSmall,
          ),
          child,
        ],
      ),
    );
  }
}

class MyToggleButton extends StatefulWidget {
  const MyToggleButton({
    super.key,
    required this.nameOne,
    required this.nameTwo,
    this.nameThree = '',
    this.height = 32,
    this.widht = 62,
    this.axisHorizontal = true,
  });

  final String nameOne;
  final String nameTwo;
  final String nameThree;
  final int widht;
  final int height;
  final bool axisHorizontal;
  @override
  State<MyToggleButton> createState() => _MyToggleButtonState();
}

class _MyToggleButtonState extends State<MyToggleButton> {
  List<bool> switcher = [false, true];
  List<bool> switcherHorizont = [true, false, false];
  @override
  Widget build(BuildContext context) {
    return widget.axisHorizontal == false
        ? Column(
            children: [
              const SizedBox(height: 12),
              ElevatedButton(
                style: ButtonStyle(
                  alignment: Alignment.centerLeft,
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  foregroundColor: switcherHorizont[0] == true
                      ? const MaterialStatePropertyAll(Colors.white)
                      : MaterialStatePropertyAll(Colors.blue.shade200),
                  minimumSize: const MaterialStatePropertyAll(
                    Size(318, 67),
                  ),
                  backgroundColor: switcherHorizont[0] == true
                      ? const MaterialStatePropertyAll(Color(0xff0148FF))
                      : const MaterialStatePropertyAll(Colors.white),
                ),
                onPressed: () {
                  switcherHorizont[0] = true;
                  switcherHorizont[1] = false;
                  switcherHorizont[2] = false;
                  setState(() {});
                },
                child: Text(
                  widget.nameOne,
                  style: MyStyle.styleTextSmall,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: ElevatedButton(
                  style: ButtonStyle(
                    alignment: Alignment.centerLeft,
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    foregroundColor: switcherHorizont[1] == true
                        ? const MaterialStatePropertyAll(Colors.white)
                        : MaterialStatePropertyAll(Colors.blue.shade200),
                    minimumSize: const MaterialStatePropertyAll(
                      Size(318, 67),
                    ),
                    backgroundColor: switcherHorizont[1] == true
                        ? const MaterialStatePropertyAll(Color(0xff0148FF))
                        : const MaterialStatePropertyAll(Colors.white),
                  ),
                  onPressed: () {
                    switcherHorizont[0] = false;
                    switcherHorizont[1] = true;
                    switcherHorizont[2] = false;
                    setState(() {});
                  },
                  child: Text(
                    widget.nameTwo,
                    style: MyStyle.styleTextSmall,
                  ),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  alignment: Alignment.centerLeft,
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  foregroundColor: switcherHorizont[2] == true
                      ? const MaterialStatePropertyAll(Colors.white)
                      : MaterialStatePropertyAll(Colors.blue.shade200),
                  minimumSize: const MaterialStatePropertyAll(
                    Size(318, 67),
                  ),
                  backgroundColor: switcherHorizont[2] == true
                      ? const MaterialStatePropertyAll(Color(0xff0148FF))
                      : const MaterialStatePropertyAll(Colors.white),
                ),
                onPressed: () {
                  switcherHorizont[0] = false;
                  switcherHorizont[1] = false;
                  switcherHorizont[2] = true;
                  setState(() {});
                },
                child: Text(
                  widget.nameThree,
                  style: MyStyle.styleTextSmall,
                ),
              ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  foregroundColor: switcher[0] == true
                      ? const MaterialStatePropertyAll(Colors.white)
                      : MaterialStatePropertyAll(Colors.blue.shade200),
                  minimumSize: MaterialStatePropertyAll(
                    Size(widget.widht.toDouble(), widget.height.toDouble()),
                  ),
                  backgroundColor: switcher[0] == true
                      ? const MaterialStatePropertyAll(Color(0xff0148FF))
                      : const MaterialStatePropertyAll(Colors.white),
                ),
                onPressed: () {
                  switcher[0] = true;
                  switcher[1] = false;
                  setState(() {});
                },
                child: Text(
                  widget.nameOne,
                  style: MyStyle.styleTextSmall,
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  foregroundColor: switcher[1] == true
                      ? const MaterialStatePropertyAll(Colors.white)
                      : MaterialStatePropertyAll(Colors.blue.shade200),
                  minimumSize: MaterialStatePropertyAll(
                    Size(widget.widht.toDouble(), widget.height.toDouble()),
                  ),
                  backgroundColor: switcher[1] == true
                      ? const MaterialStatePropertyAll(Color(0xff0148FF))
                      : const MaterialStatePropertyAll(Colors.white),
                ),
                onPressed: () {
                  switcher[0] = false;
                  switcher[1] = true;
                  setState(() {});
                },
                child: Text(
                  widget.nameTwo,
                  style: MyStyle.styleTextSmall,
                ),
              ),
            ],
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
