import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watertraker/main.dart';

class MySlider extends StatefulWidget {
  MySlider(this.max, {super.key, required this.onChanged});

  double max;
  final ValueChanged<double> onChanged;

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  double _currentValue = 0;

  @override
  Widget build(BuildContext context) {
    Provider.of<ToggleProvider>(context, listen: false).valueMax = widget.max;

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
            _currentValue = Provider.of<ToggleProvider>(context, listen: false)
                .convertCurrentValue(value);
          });
        },
        activeColor: const Color(0xff0148FF),
        thumbColor: const Color(0xff0148FF),
        inactiveColor: Colors.white,
        max: Provider.of<ToggleProvider>(context).valueMax,
        divisions: widget.max.toInt(),
        label: Provider.of<ToggleProvider>(context)
            .convertCurrentValue(_currentValue)
            .round()
            .toString(),
      ),
    );
  }
}
