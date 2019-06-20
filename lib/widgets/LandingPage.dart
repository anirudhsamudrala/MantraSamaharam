import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:flutter_app/models/Models.dart';
import 'package:flutter_app/widgets/CircleIcon.dart';
import 'package:flutter_app/widgets/ListPage.dart';

class LandingPage extends StatelessWidget {
  final String mantraFile;

  final title = 'మంత్ర సమాహారము';
  LandingPage({Key key, this.mantraFile}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        /*    appBar: AppBar(
          title: Text(title, style: TextStyle(color: Colors.black38)),
        ),*/
        appBar: AppBar(
          elevation: 0.1,
          backgroundColor: Colors.blueGrey,
          title: Text(
            title,
            style: TextStyle(fontFamily: 'NTR', color: Colors.white),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.list),
              onPressed: () {},
            )
          ],
        ),
        body:Stack(
          children: <Widget>[
/*            Container(
                padding: EdgeInsets.only(left: 10.0),
                decoration: new BoxDecoration(
                  color: Color.fromRGBO(20, 16, 33, .7),
                  image: new DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),
                    image: AssetImage('assets/images/sandhya.png')))),*/
            new Container(
              child: new Center(
                child: new FutureBuilder(
                    future: DefaultAssetBundle.of(context)
                        .loadString('assets/data/' + this.mantraFile),
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
                                    builder: (BuildContext context) => ListPage(
                                        mantras:
                                        MenuItem.fromJson(menus[index]).mantras,
                                        title: menus[index]['iconText']),
                                  )));
                        },
                      );
                    }),
              ),
            ),
          ],
        ),

/*        new Container(
          child: new Center(
            child: new FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/data/' + this.mantraFile),
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
                                builder: (BuildContext context) => ListPage(
                                    mantras:
                                        MenuItem.fromJson(menus[index]).mantras,
                                    title: menus[index]['iconText']),
                              )));
                    },
                  );
                }),
          ),
        ),*/
      ),
    );
  }
}
