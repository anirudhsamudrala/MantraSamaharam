import 'package:flutter/material.dart';

import 'widgets/CircleIcon.dart';

void main() => runApp(MyApp());

/*
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'మంత్ర సమాహారము';

    return MaterialApp(
      title: title,
      theme: ThemeData(fontFamily: 'Montserrat', primaryColor: Colors.cyan),
      home: Scaffold(
/*
        backgroundColor: Colors.cyan,
*/
        appBar: AppBar(
          title: Text(title, style: TextStyle(color: Colors.black38)),
        ),
        body: new Container(
          margin: new EdgeInsets.only(top: 40.0),
          child: GridView.count(
            // Create a grid with 2 columns. If you change the scrollDirection to
            // horizontal, this would produce 2 rows.
            crossAxisCount: 3,
            children: List.generate(12, (index) {
              return new CircleIcon();
            }),
          ),
        ),
      ),
    );
  }
}
