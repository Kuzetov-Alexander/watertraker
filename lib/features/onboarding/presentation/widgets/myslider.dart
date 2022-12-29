import 'package:flutter/material.dart';

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
