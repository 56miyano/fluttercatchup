import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';
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

  String resultAddDailySalaryList ;

  String dateToAdd;

  List<String> dailySalaryList = []; //追加した給料

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2020),
    );
    if (selected != null) {
      dateToAdd = (DateFormat.yMMMd()).format(selected);
    }
    final result = await Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => new InputPage()), //MyInputPageに移動
      );
      resultAddDailySalaryList = result.toString();
      dailySalaryList.add(resultAddDailySalaryList);
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
      body: ListView.builder(
        itemCount: dailySalaryList.length,
        itemBuilder: (context, int index) {
          return new Text(
            dateToAdd + "　　　" + dailySalaryList[index] + "円",
          );
      },
      ),
      floatingActionButton: RaisedButton(
        child: Text(('追加')),
        color: Colors.orange,
        textColor: Colors.white,
        onPressed: () => _selectDate(context),
      ),
    );
  }
}

