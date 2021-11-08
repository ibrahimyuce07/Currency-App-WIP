import 'dart:convert';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';
import 'model/currency_model_fixer.dart';
import 'model/currency_model_gemini.dart';

class CurrencyPage extends StatelessWidget {
  const CurrencyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Döviz Kurları'),
      ),
      body: MyCurrencyPage(),
    );
  }
}

class MyCurrencyPage extends StatefulWidget {
  const MyCurrencyPage({Key? key}) : super(key: key);

  @override
  _MyCurrencyPageState createState() => _MyCurrencyPageState();
}

class _MyCurrencyPageState extends State<MyCurrencyPage> {
  String? _euro = "Tap currency";
  String? _dollar = "Tap currency";
  String? _value = "SELECT";
  String? background = "images/usd_bg.jpg";
  var _kur = "KUR";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(background!),
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
            KurTryCustom(kur: _kur),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
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
    );
  }

  Future<String> getEuroFixer() async {
    var response = await http.get(Uri.parse(
        'http://data.fixer.io/api/latest?access_key=3c1c1330a2b6839076549c44801fc148&format=1'));
    var jsonResponse = json.decode(response.body);
    CurrencyModel currencyModel = CurrencyModel.fromJson(jsonResponse);
    currencyModel.rates.ratesTry =
        double.parse(currencyModel.rates.ratesTry.toStringAsFixed(4));
    setState(() {
      _euro =
          _euro == null ? "No data" : currencyModel.rates.ratesTry.toString();
      _kur = "EUR";
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
      _kur = "USD";
    });
    _value = _dollar;
    return "";
  }

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
      _kur = "USD";
    });
    _value = _dollar;
    setState(() {
      if (kIsWeb) {
        background = "images/web_usd.jpg";
      } else {
        background = "images/usd_bg.jpg";
      }
    });
    return "";
  }

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
      _kur = "EUR";
    });
    _value = _euro;
    setState(() {
      if (kIsWeb) {
        background = "images/web_eur.jpg";
      } else {
        background = "images/euro_bg.jpg";
      }
    });
    return "";
  }
}
