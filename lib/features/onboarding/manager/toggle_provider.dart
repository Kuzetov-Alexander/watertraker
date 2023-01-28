// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

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
  kilogram('кг'),
  pounds('фн');

  const WeightUnit(this.value);

  final String value;

  factory WeightUnit.fromValue(String value) {
    return WeightUnit.values.firstWhere((element) => element.value == value);
  }

  double get ada => 0;
}

enum HeightUnit {
  sm('см'),
  ft('фт');

  const HeightUnit(this.value);

  final String value;

  factory HeightUnit.fromValue(String value) {
    return HeightUnit.values.firstWhere((element) => element.value == value);
  }
}

enum QuestionDrink {
  seldom('редко'),
  week('2-3 раза в неделю'),
  everyday('ежедневно');

  const QuestionDrink(this.value);

  final String value;

  factory QuestionDrink.fromValue(String value) {
    return QuestionDrink.values.firstWhere((element) => element.value == value);
  }
}

enum QuestionSport {
  never('никогда'),
  seldom('редко'),
  often('часто');

  const QuestionSport(this.value);

  final String value;

  factory QuestionSport.fromValue(String value) {
    return QuestionSport.values.firstWhere((element) => element.value == value);
  }
}

class ToggleState<T extends Enum> {
  ToggleState({
    required this.active,
    required T value,
  }) : _value = value;

  final T _value;

  T get value => _value;

  bool active;
}

class ToggleStateValue {
  final double value;
  final double minValue;
  final double maxValue;

  ToggleStateValue({
    required this.value,
    required this.minValue,
    required this.maxValue,
  });

  ToggleStateValue copyWith({
    double? value,
    double? minValue,
    double? maxValue,
  }) {
    return ToggleStateValue(
      value: value ?? this.value,
      minValue: minValue ?? this.minValue,
      maxValue: maxValue ?? this.maxValue,
    );
  }
}

class ToggleProvider extends ChangeNotifier {
  double weightTextProvider = 4;
  double heightTextProvider = 40;
  double ageProvider = 1;
  double valueMax = 0;
  double currentValue = 0;
  final List<ToggleState<Sex>> toggleSex;
  final List<ToggleState<WeightUnit>> toggleWeightUnit;
  final List<ToggleState<HeightUnit>> toggleHeightUnit;
  final List<ToggleState<QuestionDrink>> questionDrink;
  final List<ToggleState<QuestionSport>> questionSport;
  ToggleStateValue _weightValue;

  ToggleProvider(
    ToggleStateValue weightValue, {
    required this.toggleSex,
    required this.toggleWeightUnit,
    required this.toggleHeightUnit,
    required this.questionDrink,
    required this.questionSport,
  }) : _weightValue = weightValue;

  set weightValue(ToggleStateValue value) {
    _weightValue = value.copyWith(
      value: value.value > value.maxValue ? value.maxValue : value.value,
    );
    notifyListeners();
  }

  ToggleStateValue get weightValue => _weightValue;

  ToggleState<WeightUnit> get activeWeightUnit =>
      toggleWeightUnit.firstWhere((element) => element.active);

  double get weight {
    final tt = weightValue.value *
        (activeWeightUnit.value == WeightUnit.kilogram ? 1.00 : 2.2);
    log(tt.toString());
    return weightValue.value *
        (activeWeightUnit.value == WeightUnit.kilogram ? 1.00 : 2.2);
  }

  double get weightMax =>
      weightValue.maxValue *
          (activeWeightUnit.value == WeightUnit.kilogram ? 1.00 : 2.2) +
      1;

  void changedToggleSex(Sex value) {
    for (var element in toggleSex) {
      element.active = element.value == value;
    }
    notifyListeners();
  }

  void changedToggleWeightUnit(WeightUnit value) {
    for (var element in toggleWeightUnit) {
      element.active = element.value == value;
    }
    notifyListeners();
  }

  void changedToggleHeightUnit(HeightUnit value) {
    for (var element in toggleHeightUnit) {
      element.active = element.value == value;
    }
    notifyListeners();
  }

  void changedQuestionDrink(QuestionDrink value) {
    for (var element in questionDrink) {
      element.active = element.value == value;
    }
    notifyListeners();
  }

  void changedQuestionSport(QuestionSport value) {
    for (var element in questionSport) {
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
    currentValue = currentValue * 2.2;
    notifyListeners();
  }
}
