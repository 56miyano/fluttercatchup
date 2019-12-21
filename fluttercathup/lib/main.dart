import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'バイト給料計算機',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'バイト給料計算機'),
    );

  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title,String wages}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class MyInputPage extends StatefulWidget {
  MyInputPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyInputPageState createState() => _MyInputPageState();
}

class _MyHomePageState extends State<MyHomePage> {

  num pay = 0; //初期給料額

  Future<Null> _selectDate(BuildContext context) async {

      final result = await Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => new MyInputPage()), //MyInputPageに移動
      );

      setState(() {
        pay = pay + result; //MyInputPageからwagesを受け取る
      });
  }



  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('バイト給料計算機'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "お給料の合計は" +'$pay' + "円です",
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class _MyInputPageState extends State<MyInputPage> {

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
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('バイト給料計算機'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}