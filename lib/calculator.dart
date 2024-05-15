import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SimpleCalculator extends StatefulWidget {
  const SimpleCalculator({super.key});

  @override
  State<SimpleCalculator> createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  String _output = '';
  String _operator = '';
  int input1 = 0;
  int input2 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Simple Calculator"),
        ),
        body: Center(
          child: Container(
            width: 300,
            height: 350,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: Color.fromARGB(255, 164, 162, 157)),
            //color: Color.fromARGB(255, 211, 205, 186),
            padding: EdgeInsets.all(8),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Color.fromARGB(255, 246, 244, 237)),
                    height: 50,
                    width: 270,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            _output,
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 14),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  Center(
                    child: Row(
                      children: [
                        ElevatedButton(
                          style: buttonStyle,
                          onPressed: () => handleNumberPress(7),
                          child: Text("7"),
                        ),
                        SizedBox(width: 5),
                        ElevatedButton(
                          style: buttonStyle,
                          onPressed: () => handleNumberPress(8),
                          child: Text("8"),
                        ),
                        SizedBox(width: 5),
                        ElevatedButton(
                          style: buttonStyle,
                          onPressed: () => handleNumberPress(9),
                          child: Text("9"),
                        ),
                        SizedBox(width: 5),
                        ElevatedButton(
                          style: buttonStyle,
                          onPressed: () => handleOperatorPress('/'),
                          child: Text("/"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  SizedBox(height: 1),
                  Row(
                    children: [
                      ElevatedButton(
                        style: buttonStyle,
                        onPressed: () => handleNumberPress(4),
                        child: Text("4"),
                      ),
                      SizedBox(width: 5),
                      ElevatedButton(
                        style: buttonStyle,
                        onPressed: () => handleNumberPress(5),
                        child: Text("5"),
                      ),
                      SizedBox(width: 5),
                      ElevatedButton(
                        style: buttonStyle,
                        onPressed: () => handleNumberPress(6),
                        child: Text("6"),
                      ),
                      SizedBox(width: 5),
                      ElevatedButton(
                        style: buttonStyle,
                        onPressed: () => handleOperatorPress('*'),
                        child: Text("*"),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      ElevatedButton(
                        style: buttonStyle,
                        onPressed: () => handleNumberPress(1),
                        child: Text("1"),
                      ),
                      SizedBox(width: 5),
                      ElevatedButton(
                        style: buttonStyle,
                        onPressed: () => handleNumberPress(2),
                        child: Text("2"),
                      ),
                      SizedBox(width: 5),
                      ElevatedButton(
                        style: buttonStyle,
                        onPressed: () => handleNumberPress(3),
                        child: Text("3"),
                      ),
                      SizedBox(width: 5),
                      ElevatedButton(
                        style: buttonStyle,
                        onPressed: () => handleOperatorPress('-'),
                        child: Text("-"),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      ElevatedButton(
                        style: buttonStyle,
                        onPressed: () => (print("onPressed")),
                        child: Text("0"),
                      ),
                      SizedBox(width: 5),
                      ElevatedButton(
                        style: buttonStyle,
                        onPressed: () {
                          setState(() {
                            _output = '';
                            _operator = '';
                            input1 = 0;
                            input2 = 0;
                          });
                        },
                        child: Text("C"),
                      ),
                      SizedBox(width: 5),
                      ElevatedButton(
                        style: buttonStyle,
                        onPressed: () {
                          print('input1: $input1');
                          print('input2: $input2');
                          double tempOutput = 0;
                          if (_operator == '+') {
                            tempOutput = (input1 + input2).toDouble();
                          } else if (_operator == '-') {
                            tempOutput = (input1 - input2).toDouble();
                          } else if (_operator == '/') {
                            tempOutput = input1 / input2;
                          } else if (_operator == '*') {
                            tempOutput = (input1 * input2).toDouble();
                          }

                          setState(() {
                            _output = tempOutput.toString();
                          });
                        },
                        child: Text("="),
                      ),
                      SizedBox(width: 5),
                      ElevatedButton(
                        style: buttonStyle,
                        onPressed: () => handleOperatorPress('+'),
                        child: Text("+"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  void handleNumberPress(int input) {
    print('input: $input');
    setState(() {
      _output += input.toString();
      if (_operator.isEmpty) {
        // input1
        input1 = (input1 * 10) + input;
      } else {
        // input2
        input2 = (input2 * 10) + input;
      }
    });
  }

  void handleOperatorPress(String oprtr) {
    setState(() {
      _operator = oprtr;
      _output += oprtr;
      print('output: $_output');
    });
  }

  ButtonStyle buttonStyle = ButtonStyle(
      shape: MaterialStateProperty.all(const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)))),
      backgroundColor:
          MaterialStateProperty.all(const Color.fromARGB(255, 229, 224, 209)),
      textStyle: MaterialStateProperty.all(
          const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 20, vertical: 15)));
}
