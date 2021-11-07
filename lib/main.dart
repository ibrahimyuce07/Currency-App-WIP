import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'currency_model_fixer.dart';
import 'currency_model_gemini.dart';
import 'gold_page.dart';

void main() {
  runApp(CurrencyPage());
}

class CurrencyPage extends StatelessWidget {
  // This widget is the root of your application.
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
  String? _euro = "Tap currency";
  String? _dollar = "Tap currency";
  String? _value = "SELECT";
  String? background = "images/usd_bg.jpg";
  var _KUR = "KUR";

  //get euro
  Future<String> getEuroFixer() async {
    var response = await http.get(Uri.parse(
        'http://data.fixer.io/api/latest?access_key=3c1c1330a2b6839076549c44801fc148&format=1'));
    var jsonResponse = json.decode(response.body);
    CurrencyModel currencyModel = CurrencyModel.fromJson(jsonResponse);
    //limit currencyModel.rates.ratesTry with 2 decimal
    currencyModel.rates.ratesTry =
        double.parse(currencyModel.rates.ratesTry.toStringAsFixed(4));
    setState(() {
      _euro =
          _euro == null ? "No data" : currencyModel.rates.ratesTry.toString();
      _KUR = "EUR";
    });
    _value = _euro;
    return "";
  }

  Future<String> getDollarFixer() async {
    var response = await http.get(Uri.parse(
        'http://data.fixer.io/api/latest?access_key=3c1c1330a2b6839076549c44801fc148&format=1'));
    var jsonResponse = json.decode(response.body);
    CurrencyModel currencyModel = CurrencyModel.fromJson(jsonResponse);
    currencyModel.rates.ratesUsd =
        double.parse(jsonResponse['rates']['USD'].toString());

    currencyModel.rates.ratesTry =
        double.parse(jsonResponse['rates']['TRY'].toString());

    setState(() {
      _dollar = _dollar == null
          ? "No data"
          : (currencyModel.rates.ratesTry / currencyModel.rates.usd)
              .toStringAsFixed(4);
      _KUR = "USD";
    });
    _value = _dollar;
    return "";
  }

  //get data from https://api.exchangerate.host/latest&?base=TRY and parse to gemini for usd
  Future<String> getDollarGemini() async {
    var response = await http
        .get(Uri.parse('https://api.exchangerate.host/latest?base=TRY'));
    var jsonResponse = json.decode(response.body);
    GeminiCurrencyModel currencyModelGemini =
        GeminiCurrencyModel.fromJson(jsonResponse);
    setState(() {
      _dollar = _dollar == null
          ? "No data"
          : (1 / currencyModelGemini.rates.usd).toStringAsFixed(3);
      _KUR = "USD";
    });
    _value = _dollar;
    //change background image to "assets/images/usd_bg.jpg"
    setState(() {
      background = "images/usd_bg.jpg";
    });
    return "";
  }

  //get data from https://api.exchangerate.host/latest&?base=TRY and parse to gemini for euro
  Future<String> getEuroGemini() async {
    var response = await http
        .get(Uri.parse('https://api.exchangerate.host/latest?base=TRY'));
    var jsonResponse = json.decode(response.body);
    GeminiCurrencyModel currencyModelGemini =
        GeminiCurrencyModel.fromJson(jsonResponse);
    setState(() {
      _euro = _euro == null
          ? "No data"
          : (1 / currencyModelGemini.rates.eur).toStringAsFixed(3);
      _KUR = "EUR";
    });
    _value = _euro;
    //change background image to "assets/images/euro_bg.jpg"
    setState(() {
      background = "images/euro_bg.jpg";
    });
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Currency App',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Döviz Kurları'),
              onTap: () {
                setState(() {
                 //route to MyApp
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CurrencyPage()),
                  );
                });
                getDollarGemini();
              },
            ),
            ListTile(
              title: Text('Altın Fiyatları'),
              onTap: () {
                //set state to MyApp
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyGoldPage()),
                  );
                });
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Currency App'),
      ),



      body: Container(
        //change background image to background
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(background!),
            //fade background image
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.dstATop),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              CurrentDateCustom(),
              SizedBox(
                height: 50,
              ),
              KurValueCustom(value: _value),
              KurTryCustom(KUR: _KUR),
              SizedBox(
                height: 50,
              ),
              Row(
                //center row
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    //button color is hexadecimal: 003399
                    color: Color(0xFF003399),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    //button size
                    height: 60,
                    minWidth: 120,

                    onPressed: () {
                      getEuroGemini();
                    },
                    child: Icon(CupertinoIcons.money_euro,
                        size: 40,
                        //button color 255, 221, 0
                        color: Color(0xFFFFD700)),
                  ),
                  MaterialButton(
                    //button color is 228D57
                    color: Color(0xFF228D57),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    //button size
                    height: 60,
                    minWidth: 120,
                    onPressed: () {
                      getDollarGemini();
                    },
                    child: Icon(
                      CupertinoIcons.money_dollar,
                      size: 40,
                      //button color 	133, 187, 101
                      color: Colors.white,
                    ),
                  ),
                ],
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
      style: TextStyle(fontSize: 50,
          fontWeight: FontWeight.bold,
          color: Colors.black),

    );
  }
}

class KurTryCustom extends StatelessWidget {
  const KurTryCustom({
    Key? key,
    required String KUR,
  })  : _KUR = KUR,
        super(key: key);

  final String _KUR;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$_KUR/TRY',
      style: TextStyle(fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.black.withOpacity(0.7)),
    );
  }
}
