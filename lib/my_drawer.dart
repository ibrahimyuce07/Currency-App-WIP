//create widget MyDrawer
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'calculator.dart';
import 'currency_page.dart';
import 'gold_page.dart';
import 'main.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
          ListTiles(),
        ],
      ),
    );
  }
  }

  class ListTiles extends StatefulWidget {
    const ListTiles({Key? key}) : super(key: key);

    @override
    _ListTilesState createState() => _ListTilesState();
  }

  class _ListTilesState extends State<ListTiles> {
    @override
    Widget build(BuildContext context) {
      return Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.attach_money),
            title: Text('Currency'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CurrencyPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.attach_money),
            title: Text('Gold'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyGoldPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.attach_money),
            title: Text('Calculator'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyCalculatorPage()),
              );
            },
          ),
        ],

      );
    }
  }


