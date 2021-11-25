import 'dart:io';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:demoapp/button_calculator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'CALCULATOR',
            style: TextStyle(color: Colors.red),
          ),
          centerTitle: true,
          leading: TextButton(
            onPressed: () {
              exit(0);
            },
            child: Icon(
              CupertinoIcons.left_chevron,
              color: Colors.white,
            ),
          ),
        ),
        body: Container(
          child: Calculator(),
          color: Colors.grey,
        ),
      ),
    );
  }
}

class OutputBar extends StatelessWidget {
  String output = '';
  OutputBar({Key? key, required this.output}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Text(
          output,
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
      width: 410,
    );
  }
}

class Calculator extends StatefulWidget {
  Calculator({Key? key}) : super(key: key);
  @override
  CalculatorState createState() {
    return CalculatorState();
  }
}

class CalculatorState extends State<Calculator> {
  String output = '';
  var result = 0.0;
  String input = '';
  var a = 0.0, b = 0.0;
  bool aHaveVal = true;
  bool haveope = true;
  String ope = '';
  CalculatorState();

  ButtonInput({required String button}) {
    return Container(
      child: TextButton(
        onPressed: () {
          setState(() {
            if (button == 'C') {
              this.output = '';
              this.input = '';
              this.result = 0.0;
              aHaveVal = true;
              haveope = true;
              ope = '';
            } else {
              this.output += button;
              if (button == '0' ||
                  button == '1' ||
                  button == '2' ||
                  button == '3' ||
                  button == '4' ||
                  button == '5' ||
                  button == '6' ||
                  button == '7' ||
                  button == '8' ||
                  button == '9') this.input += button;
            }
          });
        },
        child: Button(input: button),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        color: Colors.black,
      ),
    );
  }

  ButtonOperator({required String operator}) {
    return Container(
      child: TextButton(
        onPressed: () {
          setState(() {
            this.output += operator;
            if (aHaveVal) {
              a = double.parse(input);
              this.input = '';
              aHaveVal = false;
            } else {
              b = double.parse(input);
              this.input = '';
            }
            if (haveope) {
              ope = operator;
              haveope = false;
            }
            if (a > 0 && b > 0) {
              if (ope == '+') {
                result = a + b;
              }
              if (ope == '-') {
                result = a - b;
              }
              if (ope == '*') {
                result = a * b;
              }
              if (ope == '/') {
                result = a / b;
              }
            }
            if (operator == '=') {
              output = result.toString() + '  FINISHED !';
            }
          });
        },
        child: Operator(operator: operator),
      ),
      decoration: BoxDecoration(
        color: Colors.yellow,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: OutputBar(
            output: output,
          ),
          flex: 2,
        ),
        Expanded(
          child: Container(
            child: GridView.count(
              crossAxisCount: 4,
              children: [
                ButtonInput(button: 'C'),
                ButtonInput(button: '\$'),
                ButtonInput(button: '%'),
                ButtonOperator(operator: '/'),
                ButtonInput(button: '7'),
                ButtonInput(button: '8'),
                ButtonInput(button: '9'),
                ButtonOperator(operator: '-'),
                ButtonInput(button: '4'),
                ButtonInput(button: '5'),
                ButtonInput(button: '6'),
                ButtonOperator(operator: '+'),
                ButtonInput(button: '1'),
                ButtonInput(button: '2'),
                ButtonInput(button: '3'),
                ButtonOperator(operator: '*'),
                ButtonInput(button: '0'),
                ButtonInput(button: '.'),
                ButtonOperator(operator: '='),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: Text("Cút hay ở lại !"),
                          content: Text(
                            "Cút thì cút luôn",
                            style: TextStyle(fontSize: 30),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                exit(0);
                              },
                              child: Text("Cút"),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop('HELLO');
                              },
                              child: Text("Đéo Cút"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text(
                    "ESC",
                    style: TextStyle(fontSize: 30, color: Colors.red),
                  ),
                ),
              ],
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 8.0,
            ),
            margin: EdgeInsets.all(10),
          ),
          flex: 7,
        ),
      ],
    );
  }
}
