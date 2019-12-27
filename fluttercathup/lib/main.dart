import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'input.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'バイト給料計算機',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
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

  double totalFee = 0;

  List<String> dailySalaryList = [];

  String stringResult ;

  String selectedDate;

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2020),
    );
    if (selected != null) {
      initializeDateFormatting('ja');
      selectedDate = (DateFormat.yMMMd('ja')).format(selected);
      final result = await Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => new InputPage()), //MyInputPageに移動
      );
      totalFee = totalFee + result;
      stringResult = result.toString();
      dailySalaryList.add(selectedDate + "の給料　　" +stringResult +"円　　合計金額　　" + '$totalFee');
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('バイト給料計算機'),
      ),
      body: Center(
        child: ListView.builder(
        itemCount: dailySalaryList.length,
        itemBuilder: (context, int index) {
          return Card(
            color: Colors.yellow,
            child :Text(
              dailySalaryList[index] + "円",
            ),
          );
         },
        ),
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