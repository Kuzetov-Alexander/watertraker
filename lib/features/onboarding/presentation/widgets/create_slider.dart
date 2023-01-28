import 'package:flutter/material.dart';

class MySl extends StatefulWidget {
  const MySl({
    super.key,
    required this.max,
    required this.onChanged,
    required this.value,
  });

  final double max;
  final ValueChanged<double> onChanged;
  final double value;

  @override
  State<MySl> createState() => _MySliderState();
}

class _MySliderState extends State<MySl> {
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
        value: widget.value,
        onChanged: (double value) {
          widget.onChanged(value);
        },
        activeColor: const Color(0xff0148FF),
        thumbColor: const Color(0xff0148FF),
        inactiveColor: Colors.white,
        max: widget.max,
        divisions: widget.max.toInt(),
        label: widget.value.toStringAsFixed(0),
      ),
    );
  }
}
