import 'package:flutter/foundation.dart';

enum Operator { addition, subtraction, multiplication, division, percentage }

class CalculatorModel extends ChangeNotifier {
  String _display = "";
  String _result = "";
  Operator? _currentOperator;

  String get display => _display;
  // String get result => _result;

  String _addOperation() {
    List<String> parts = _display.split('+');
    double sum = 0;
    for (String part in parts) {
      sum += double.parse(part);
    }
    return sum.toString();
  }

  String _subtractOperation() {
    List<String> parts = _display.split('-');
    double result = double.parse(parts[0]);
    for (int i = 1; i < parts.length; i++) {
      result -= double.parse(parts[i]);
    }
    return result.toString();
  }

  String _multiplyOperation() {
    List<String> parts = _display.split('*');
    double product = 1;
    for (String part in parts) {
      product *= double.parse(part);
    }
    return product.toString();
  }

  String _divideOperation() {
    List<String> parts = _display.split('/');
    double result = double.parse(parts[0]);
    for (int i = 1; i < parts.length; i++) {
      double num = double.parse(parts[i]);
      if (num == 0) {
        throw Exception("You Can't divide by zero!");
      }
      result /= num;
    }
    return result.toString();
  }

  String _percentageOperation() {
    double num = double.parse(_display.substring(0, _display.length - 1));
    return (num / 100).toString();
  }

  void checkOpreator(String input) {
    if (input.contains('+')) {
      _currentOperator = Operator.addition;
    } else if (input.contains("-")) {
      _currentOperator = Operator.subtraction;
    } else if (input.contains("-")) {
      _currentOperator = Operator.subtraction;
    } else if (input.contains("*")) {
      _currentOperator = Operator.multiplication;
    } else if (input.contains("/")) {
      _currentOperator = Operator.division;
    } else if (input.contains("%")) {
      _currentOperator = Operator.percentage;
    } else {
      _currentOperator = null;
    }
  }

  void addToDisplay(String value) {
    _display += value;
    notifyListeners();
  }

  void removeFromDisplay() {
    if (_display.isNotEmpty) {
      _display = _display.substring(0, _display.length - 1);
      notifyListeners();
    }
  }

  void clearDisplay() {
    _display = "";
    _result = "";
    notifyListeners();
  }

  void calculate() {
    checkOpreator(_display);
    switch (_currentOperator) {
      case Operator.addition:
        _result = _addOperation();
        break;
      case Operator.subtraction:
        _result = _subtractOperation();
        break;
      case Operator.multiplication:
        _result = _multiplyOperation();
        break;
      case Operator.division:
        _result = _divideOperation();
        break;
      case Operator.percentage:
        _result = _percentageOperation();
        break;
      default:
    }
    _display = _result;

    notifyListeners();
  }
}
