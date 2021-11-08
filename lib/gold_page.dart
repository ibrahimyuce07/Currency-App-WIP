
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MyGoldPage extends StatelessWidget {
  const MyGoldPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Altın Fiyatları'),
      ),
      body: Container(
        //backgrond image gold
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/gold.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          //add text

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Altın Fiyatları Geliştirme Aşamasında'
              ,
                //style text
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,

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
    );
  }
}