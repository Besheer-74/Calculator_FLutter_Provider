import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/logic.dart';

class CalculatorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final calculatorModel = Provider.of<CalculatorModel>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "A7SB",
                style: TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  calculatorModel.display,
                  style: TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.deepOrange,
                  ),
                ),
              ),
              numberRow("C", "%", ">", "/", calculatorModel),
              numberRow("7", "8", "9", "*", calculatorModel),
              numberRow("4", "5", "6", "-", calculatorModel),
              numberRow("1", "2", "3", "+", calculatorModel),
              numberRow("00", "0", ".", "=", calculatorModel),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton(String text, CalculatorModel calculatorModel) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.orange.shade500),
      ),
      onPressed: () {
        if (text == '=') {
          calculatorModel.calculate();
        } else if (text == 'C') {
          calculatorModel.clearDisplay();
        } else if (text == ">") {
          calculatorModel.removeFromDisplay();
        } else {
          calculatorModel.addToDisplay(text);
        }
      },
      child: Text(
        text,
        style: TextStyle(
          fontSize: 25,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget numberRow(String number1, String number2, String number3,
      String number4, CalculatorModel calculatorModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildButton(number1, calculatorModel),
        buildButton(number2, calculatorModel),
        buildButton(number3, calculatorModel),
        buildButton(number4, calculatorModel),
      ],
    );
  }
}
