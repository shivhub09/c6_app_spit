import 'package:c6/models.dart/model.dart';
import 'package:flutter/material.dart';

class InputDataProvider with ChangeNotifier {
  InputData? _inputData;

  InputData? get inputData => _inputData;

  void updateInputData(InputData data) {
    _inputData = data;
    notifyListeners();
  }
}
