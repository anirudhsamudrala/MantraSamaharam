import 'package:flutter/material.dart';

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

    Color gradientStart =
        Colors.deepPurple[700]; //Change start gradient color here
    Color gradientEnd = Colors.purple[500]; //Change end gradient color here

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
          margin: new EdgeInsets.only(top: 50.0),
          child: GridView.count(
            // Create a grid with 2 columns. If you change the scrollDirection to
            // horizontal, this would produce 2 rows.
            crossAxisCount: 3,
            children: List.generate(12, (index) {
              return new DebugUiPage();
            }),
          ),
        ),
      ),
    );
  }
}

class DebugUiPage extends StatefulWidget {
  DebugUiPage({Key key}) : super(key: key);

  @override
  _DebugUiPageState createState() => new _DebugUiPageState();
}

class _DebugUiPageState extends State<DebugUiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
/*        child: new Container(
        decoration: new BoxDecoration(
        color: Colors.purple,
        gradient: new LinearGradient(
        colors: [Colors.red, Colors.cyan],
        begin: Alignment.centerRight,
        end: Alignment.centerLeft
    ),
    ),*/
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
                backgroundImage: AssetImage("assets/images/om.jpg"),
                radius: 30),
            SizedBox(height: 10),
            Text(
              "Chocolate",
              style: TextStyle(color: Colors.black38),
            ),
          ],
        ),
      ),
      /* ),*/
    );
  }
}
