import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class MyCalculatorPage extends StatelessWidget {
  const MyCalculatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kur Çevirici'),
      ),
      body: Container(
        //backgrond image gold
        decoration: BoxDecoration(
        ),
        child: Center(
          //add text

          child: Container(
            //fixed width
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Kur Çevirici Geliştirme Aşamasında'
                  ,
                  //style text
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,

                  ),
                  textAlign: TextAlign.center,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigate back to first screen when tapped!
                    Navigator.pop(context);
                  },
                  child: const Text('Geri dön!'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}