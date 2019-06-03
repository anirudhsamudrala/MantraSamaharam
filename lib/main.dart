import 'package:flutter/material.dart';
import 'widgets/CircleIcon.dart';
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final title = 'మంత్ర సమాహారము';

    return MaterialApp(
      title: title,
      theme: ThemeData(fontFamily: 'Montserrat', primaryColor: Colors.cyan),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title, style: TextStyle(color: Colors.black38)),
        ),
        body: new Container(
          child: new Center(
            child: new FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/data/menu.json'),
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
                      return CircleIcon(
                          iconImage: menus[index]['iconImage'],
                          iconText: menus[index]['iconText']);
                    },
                  );
                }),
          ),
        ),
      ),
    );
  }
}
