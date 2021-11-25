import 'package:demoapp/main.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Operator extends StatelessWidget {
  String operator = '';
  Operator({Key? key, required this.operator}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        operator,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 50,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Button extends StatelessWidget {
  String input = '';
  Button({Key? key, required this.input}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      input,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 50,
      ),
    );
  }
}
