import 'package:flutter/material.dart';
import 'widgets/CircleIcon.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'widgets/ListPage.dart';
import 'package:flutter_app/models/Models.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'మంత్ర సమాహారము';

    return MaterialApp(
      title: title,
/*
      theme: ThemeData(fontFamily: 'Montserrat', primaryColor: Colors.cyan),
*/
      theme: new ThemeData(fontFamily: 'NTR',primaryColor: Colors.amber),
      home: Scaffold(
        /*    appBar: AppBar(
          title: Text(title, style: TextStyle(color: Colors.black38)),
        ),*/
        appBar:
        AppBar(
          elevation: 0.1,
          backgroundColor: Colors.amberAccent,
          title: Text(title,style: TextStyle(fontFamily: 'NTR'), ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.list),
              onPressed: () {},
            )
          ],
        ),
        body: new Container(
/*
          color: Color.fromRGBO(58, 66, 86, 1.0),
*/
          child: new Center(
            child: new FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/data/telugu.json'),
                builder: (context, snapshot) {
                  var menus = json.decode(snapshot.data.toString());

                  return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: menus.length,
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return new GestureDetector(
                          child: new CircleIcon(
                              iconImage: menus[index]['iconImage'],
                              iconText: menus[index]['iconText']),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ListPage(mantras: MenuItem.fromJson(menus[index]).mantras,title:menus[index]['iconText']),
                              )));
                    },
                  );
                }),
          ),
        ),
      ),
    );
  }
}
