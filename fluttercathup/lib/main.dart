import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'input.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'バイト給料計算機',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyWage(title: 'バイト給料計算機'),
    );

  }
}

class MyWage extends StatefulWidget {
  MyWage({Key key, this.title,String wages}) : super(key: key);

  final String title;

  @override
  _MyWageState createState() => _MyWageState();
}


class _MyWageState extends State<MyWage> {

  num pay = 0; //初期給料額

  Future<Null> _selectDate(BuildContext context) async {

      final result = await Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => new InputPage()), //MyInputPageに移動
      );

      setState(() {
        pay = pay + result; //MyInputPageからwagesを受け取る
      });
  }



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
              "お給料の合計は" +'$pay' + "円です" + "テスト",
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: RaisedButton(
        child: Text("追加"),
        color: Colors.orange,
        textColor: Colors.white,
        onPressed: () => _selectDate(context),
      ),
    );
  }
}

