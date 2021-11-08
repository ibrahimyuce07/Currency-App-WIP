import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCalculatorPage extends StatelessWidget {
  const MyCalculatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kur Çevirici'),
      ),
      body: Container(
        decoration: BoxDecoration(),
        child: Container(
            width: MediaQuery.of(context).size.width, child: MyCalculator()),
      ),
    );
  }
}

class MyCalculator extends StatefulWidget {
  const MyCalculator({Key? key}) : super(key: key);

  @override
  _MyCalculatorState createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  double _input = 0;
  double _valueUSD = 0;
  double _valueEUR = 0;
  double _valueGBP = 0;
  double _value = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RaisedButton(
              onPressed: () {
                setState(() {
                  _valueUSD = _input * 0.2;
                  _value = _valueUSD;
                });
              },
              child: Text('Dolar'),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  _valueEUR = _input * 0.3;
                  _value = _valueEUR;
                });
              },
              child: Text('Euro'),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  _valueGBP = _input * 0.4;
                  _value = _valueGBP;
                });
              },
              child: Text('Pound'),
            ),
          ],
        ),

        Text(
          //print value
          '${_value.toStringAsFixed(2)}',

          style: TextStyle(
            fontSize: 80,
            fontWeight: FontWeight.bold,
          ),
        ),

        Expanded(
          child: TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: 'Kur Değeri Giriniz',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            keyboardType: TextInputType.number,
            onChanged: (text) {
             _input = double.parse(text);
            },
          ),
        ),
        RaisedButton(
          child: Text('Reset'),
          onPressed: () {
            setState(() {
              _input = 0;
              _valueUSD = 0;
              _valueEUR = 0;
              _valueGBP = 0;
              _value = 0;

            });
          },
        ),
      ],
    );
  }
}
