import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum Sex {
  male('Мужской'),
  female('Женский');

  const Sex(this.value);

  final String value;

  factory Sex.fromValue(String value) {
    return Sex.values.firstWhere((element) => element.value == value);
  }
}

enum WeightUnit {
  kilogram,
  pounds;
}

enum HeightUnit {
  sm,
  ft;
}

// нужен для бул значения переключения
class ToggleState<T extends Enum> {
  ToggleState({
    required this.active,
    required T value,
  }) : _value = value;

  final T _value;

  T get value => _value;

  bool active;
}

class ToggleProvider extends ChangeNotifier {
  double weightTextProvider = 4;
  double heightTextProvider = 40;
  double ageProvider = 1;
  double valueMax = 0;
  double currentValue = 0;
  final List<ToggleState<Sex>> toggleSex;

  ToggleProvider(this.toggleSex);

  void changedToggleSex(Sex value) {
    for (var element in toggleSex) {
      element.active = element.value == value;
    }
    notifyListeners();
  }

  double convertCurrentValue(double a) {
    return currentValue = a;
  }

  void convertValueMax(double a) {
    valueMax = a;
    notifyListeners();
  }

  void convertWeight(double a) {
    weightTextProvider = a;
    notifyListeners();
  }

  void convertHeight(double a) {
    heightTextProvider = a;
    notifyListeners();
  }

  void convertAge(double a) {
    ageProvider = a;
    notifyListeners();
  }

  void recalculation() {
    weightTextProvider = weightTextProvider * 2.2;
    heightTextProvider = heightTextProvider * 0.033;
    notifyListeners();
  }
}
