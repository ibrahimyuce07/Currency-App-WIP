import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:try_currency/my_drawer.dart';
import 'calculator.dart';
import 'currency_page.dart';
import 'gold_page.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Döviz Kurları'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Container(
        //change background image to background
        child: Center(
          //text widget
          child: Column(
            children: [
              Text(
                ' H O M E P A G E',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              ListTile(
                title: Text('Döviz Kurları'),
                subtitle: Text('Döviz kurlarını görüntülemek için tıklayınız'),
                trailing: Icon(Icons.attach_money),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CurrencyPage(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text('Kuru Hesapla'),
                subtitle: Text('Kuru hesaplamak için tıklayınız'),
                trailing: Icon(Icons.attach_money),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyCalculatorPage(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text('Altın Kurları'),
                subtitle: Text('Altın kurlarını görüntülemek için tıklayınız'),
                trailing: Icon(Icons.attach_money),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyGoldPage(),
                    ),
                  );
                },
              ),


            ],
          ),

        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class CurrentDateCustom extends StatelessWidget {
  const CurrentDateCustom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Text(
        DateFormat('dd-MM-yyyy').format(DateTime.now()),
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class KurValueCustom extends StatelessWidget {
  const KurValueCustom({
    Key? key,
    required String? value,
  })  : _value = value,
        super(key: key);

  final String? _value;

  @override
  Widget build(BuildContext context) {
    return Text(
      _value!,
      style: TextStyle(
          fontSize: 50, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }
}

class KurTryCustom extends StatelessWidget {
  const KurTryCustom({
    Key? key,
    required String kur,
  })  : _kur = kur,
        super(key: key);

  final String _kur;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$_kur/TRY',
      style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.black.withOpacity(0.7)),
    );
  }
}
