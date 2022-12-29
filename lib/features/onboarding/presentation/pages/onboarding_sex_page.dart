import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watertraker/utils/extension.dart';
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
  double weightText = 4;
  double heightText = 40;
  double age = 1;
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
                    listData: [
                      ToggleData(name: 'Мужской', isDefault: true),
                      ToggleData(name: 'Женский')
                    ],
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
                          listData: [
                            ToggleData(name: 'кг', isDefault: true),
                            ToggleData(name: 'фн'),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                MyContainer(
                  data: weightText.toInt().toString(),
                  child: MySlider(
                    150,
                    onChanged: (value) {
                      setState(() {
                        weightText = value;
                      });
                    },
                  ),
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
                          listData: [
                            ToggleData(name: 'см', isDefault: true),
                            ToggleData(name: 'фт'),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                MyContainer(
                  data: heightText.toInt().toString(),
                  child: MySlider(
                    220,
                    onChanged: (value) => setState(() {
                      heightText = value;
                    }),
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
                  data: age.toInt().toString(),
                  child: MySlider(
                    100,
                    onChanged: (value) => setState(() {
                      age = value;
                    }),
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

class MyContainer extends StatelessWidget {
  const MyContainer({
    super.key,
    this.data,
    required this.child,
  });
  final String? data;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(24.0),
          ),
        ),
        color: Colors.blueGrey.shade100,
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          if (data != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(24.0),
                  ),
                ),
                color: Colors.white,
              ),
              child: Text(
                data ?? '',
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff33E34F),
                ),
              ),
            ),
          child,
        ],
      ),
    );
  }
}

class ToggleData {
  ToggleData({
    required this.name,
    this.isDefault = false,
  });

  final bool isDefault;
  final String name;
}

enum ToggleAlignment { vertical, horizontal }

class MyToggleButton extends StatefulWidget {
  const MyToggleButton({
    super.key,
    this.listData = const [],
    this.height = 32,
    this.width = double.infinity,
    this.alignment = ToggleAlignment.horizontal,
  });

  final ToggleAlignment alignment;
  final List<ToggleData> listData;
  final double width;
  final double height;

  @override
  State<MyToggleButton> createState() => _MyToggleButtonState();
}

class _MyToggleButtonState extends State<MyToggleButton> {
  late List<bool> switcherHorizont;

  @override
  void initState() {
    super.initState();
    switcherHorizont = widget.listData.map((e) => e.isDefault).toList();
  }

  Widget _buildLayout(List<Widget> a) {
    if (widget.alignment == ToggleAlignment.vertical) {
      return Column(
        children: a,
      );
    } else {
      return Row(
        children: a,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildLayout(
      widget.listData
          .mapIndexed(
            (i, e) => Padding(
              padding: EdgeInsets.only(
                top: i != 0 && widget.alignment == ToggleAlignment.vertical
                    ? 10
                    : 0,
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  foregroundColor: switcherHorizont[i]
                      ? const MaterialStatePropertyAll(Colors.white)
                      : MaterialStatePropertyAll(Colors.blue.shade200),
                  minimumSize: widget.alignment == ToggleAlignment.horizontal
                      ? MaterialStatePropertyAll(
                          Size(widget.width, widget.height),
                        )
                      : MaterialStatePropertyAll(
                          Size(widget.width, widget.height),
                        ),
                  maximumSize: widget.alignment == ToggleAlignment.horizontal
                      ? MaterialStatePropertyAll(
                          Size(widget.width, widget.height),
                        )
                      : MaterialStatePropertyAll(
                          Size(widget.width, widget.height),
                        ),
                  backgroundColor: switcherHorizont[i]
                      ? const MaterialStatePropertyAll(Color(0xff0148FF))
                      : const MaterialStatePropertyAll(Colors.white),
                ),
                onPressed: () {
                  switcherHorizont[i] = true;
                  for (int j = 0; j < switcherHorizont.length; j++) {
                    if (j != i) {
                      switcherHorizont[j] = false;
                    }
                  }
                  setState(() {});
                },
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    e.name,
                    textAlign: widget.alignment == ToggleAlignment.vertical
                        ? TextAlign.start
                        : TextAlign.center,
                    style: MyStyle.styleTextSmall,
                  ),
                ),
              ),
            ),
          )
          .insertSeparator(
            const SizedBox(
              width: 10,
            ),
          )
          .map(
            (e) => e is SizedBox || widget.alignment == ToggleAlignment.vertical
                ? e
                : Expanded(child: e),
          )
          .toList(),
    );
  }
}

class MySlider extends StatefulWidget {
  const MySlider(this.max, {super.key, required this.onChanged});

  final double max;
  final ValueChanged<double> onChanged;

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
          widget.onChanged(value);
          setState(() {
            _currentValue = value;
          });
        },
        activeColor: const Color(0xff0148FF),
        thumbColor: const Color(0xff0148FF),
        inactiveColor: Colors.white,
        max: widget.max,
        divisions: widget.max.toInt(),
        label: _currentValue.round().toString(),
      ),
    );
  }
}
