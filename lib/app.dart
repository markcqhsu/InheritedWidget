import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'config_wrapper.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //因為在env_config裡面已經有定義了, 所以刪除
  // int _counter = 0;

  //因為在config_wrapper裡面已經有定義了, 所以刪除
  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _TitleText(),
            _CountText(),
          ],
        ),
      ),
      floatingActionButton: _FloatBtn(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class _TitleText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'You have pushed the button this many times:',
    );
  }
}

class _CountText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      '${ConfigWrapper.of(context).widget.config.count}',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class _FloatBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: ConfigWrapper.of(context).incrementCounter,
      tooltip: 'Increment',
      child: Icon(Icons.add),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
