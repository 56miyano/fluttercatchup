import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'main.dart';

class InputPage extends StatefulWidget {
  InputPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  var wages;

  var per = 0.0;

  var u8822 = 0.0;

  var o8822 = 0.0;

  var u8225 = 0.0;

  var o8225 = 0.0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('バイト給料計算機'),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(

              '$wages'
            ),
            new TextField(
              keyboardType: TextInputType.number,
              enabled: true,
              maxLength: 10,
              maxLengthEnforced: false,
              obscureText: false,
              onChanged: (text) {
                per = double.parse(text.toString());
                setState(() {
                  wages = per*(u8822+o8822*1.25+u8225*1.25+o8225*1.5) ;
                });
              },
              decoration: const InputDecoration(
                labelText: '時給',
              ),
            ),
          new TextField(
            keyboardType: TextInputType.number,
            enabled: true,
            maxLength: 10,
            maxLengthEnforced: false,
            obscureText: false,
            onChanged: (text) {
              u8822= double.parse(text.toString());
              setState(() {
                wages = per*(u8822+o8822*1.25+u8225*1.25+o8225*1.5);
              });
            },
            decoration: const InputDecoration(
              labelText: '8時間を超えずに行った8~22時の労働時間',
            ),
          ),
            new TextField(
              keyboardType: TextInputType.number,
              enabled: true,
              maxLength: 10,
              maxLengthEnforced: false,
              obscureText: false,
              onChanged: (text) {
                o8822 = double.parse(text.toString());
                setState(() {
                  wages = per*(u8822+o8822*1.25+u8225*1.25+o8225*1.5);
                });
              },
              decoration: const InputDecoration(
                labelText: '8時間を超えて行った8~22時の労働時間',
              ),
            ),
            new TextField(
              keyboardType: TextInputType.number,
              enabled: true,
              maxLength: 10,
              maxLengthEnforced: false,
              obscureText: false,
              onChanged: (text) {
                u8225 = double.parse(text.toString());
                setState(() {
                  wages = per*(u8822+o8822*1.25+u8225*1.25+o8225*1.5);
                });
              },
              decoration: const InputDecoration(
                labelText: '8時間を超えずに行った22~5時の労働時間',
              ),
            ),
            new TextField(
              keyboardType: TextInputType.number,
              enabled: true,
              maxLength: 10,
              maxLengthEnforced: false,
              obscureText: false,
              onChanged: (text) {
                o8225 = double.parse(text.toString());
                setState(() {
                  wages = per*(u8822+o8822*1.25+u8225*1.25+o8225*1.5);
                });
              },
              decoration: const InputDecoration(
                labelText: '8時間を超えて行った22~5時の労働時間',
              ),
            )
        ],
        ),
      ),
      floatingActionButton: RaisedButton(
        child: Text("追加"),
        color: Colors.orange,
        textColor: Colors.white,
        onPressed :() {
          Navigator.pop(context,wages);
          }
      ),
    );
  }
}