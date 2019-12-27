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

  double dailySalary = 0;

  double hourlyWage  = 0.0;

  double under8hFrom8to22 = 0.0;

  double over8hFrom8to22 = 0.0;

  double under8hFrom22to5 = 0.0;

  double over8hFrom22to5 = 0.0;

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
              '$dailySalary'
            ),
            new TextField(
              keyboardType: TextInputType.number,
              enabled: true,
              maxLength: 10,
              maxLengthEnforced: false,
              obscureText: false,
              onChanged: (text) {
                hourlyWage  = double.parse(text.toString());
                setState(() {
                  dailySalary = hourlyWage*(under8hFrom8to22+over8hFrom8to22*1.25+under8hFrom22to5*1.25+over8hFrom22to5*1.5) ;
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
              under8hFrom8to22= double.parse(text.toString());
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
                over8hFrom8to22 = double.parse(text.toString());
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
                under8hFrom8to22 = double.parse(text.toString());
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
                over8hFrom22to5 = double.parse(text.toString());
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
          Navigator.pop(context,dailySalary);
          }
      ),
    );
  }
}