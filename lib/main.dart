import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: miniCalc(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class miniCalc extends StatefulWidget {
  const miniCalc({Key? key}) : super(key: key);

  @override
  State<miniCalc> createState() => _miniCalcState();
}

class _miniCalcState extends State<miniCalc> {
  String output = '0';
  String _output = '0';
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = '';

  operation(String btntext) {
    if (btntext == 'C') {
      _output = '0';
      num1 = 0.0;
      num2 = 0.0;
      operand = '';
    } else if (btntext == '/' ||
        btntext == '*' ||
        btntext == '+' ||
        btntext == '-') {
      num1 = double.parse(output);
      operand = btntext;
      _output = '0';
    } else if (btntext == '=') {
      num2 = double.parse(output);
      if (operand == '/') {
        _output = (num1 / num2).toString();
      }
      if (operand == '*') {
        _output = (num1 * num2).toString();
      }
      if (operand == '+') {
        _output = (num1 + num2).toString();
      }
      if (operand == '-') {
        _output = (num1 - num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = '';
    } else {
      _output = _output + btntext;
    }

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget button(String btntext) {
    return Expanded(
      child: RawMaterialButton(
        shape: Border.all(color: Colors.yellowAccent, width: 1.5),
        fillColor: Colors.lightBlue,
        padding: EdgeInsets.all(29.0),
        splashColor: Colors.blueGrey,
        onPressed: () {
          operation(btntext);
        },
        child: Text(
          '$btntext',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculator',
          style: TextStyle(color: Colors.blue),
        ),
        backgroundColor: Colors.yellow,
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.amberAccent, width: 1.8),
                  color: Colors.white38,
                ),
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.all(5.0),
                child: Text(
                  '$output',
                  style: TextStyle(
                      fontSize: 40.0,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Row(
              children: [
                button('7'),
                SizedBox(width: 4.5),
                button('8'),
                SizedBox(width: 4.5),
                button('9'),
                SizedBox(width: 4.5),
                button('/'),
              ],
            ),
            SizedBox(height: 4.5),
            Row(
              children: [
                button('4'),
                SizedBox(width: 4.5),
                button('5'),
                SizedBox(width: 4.5),
                button('6'),
                SizedBox(width: 4.5),
                button('*'),
              ],
            ),
            SizedBox(height: 4.5),
            Row(
              children: [
                button('1'),
                SizedBox(width: 4.5),
                button('2'),
                SizedBox(width: 4.5),
                button('3'),
                SizedBox(width: 4.5),
                button('+'),
              ],
            ),
            SizedBox(height: 4.5),
            Row(
              children: [
                button('0'),
                SizedBox(width: 4.5),
                button('C'),
                SizedBox(width: 4.5),
                button('-'),
                SizedBox(width: 4.5),
                button('='),
              ],
            )
          ],
        ),
      ),
    );
  }
}
