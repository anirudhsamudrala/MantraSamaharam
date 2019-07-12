import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mantra_samahara/models/Models.dart';
import 'package:mantra_samahara/widgets/CircleIcon.dart';
import 'package:mantra_samahara/widgets/ListPage.dart';
import 'package:mantra_samahara/widgets/Loader.dart';

class LandingPage extends StatefulWidget {
  final String mantraFile;

  LandingPage({Key key, this.mantraFile}) : super(key: key);

  @override
  _LandingPage createState() => _LandingPage(mantraFile);
}

class _LandingPage extends State<LandingPage> {
  final String _mantraFile;

  Future _future;
  List<MenuItem> menuItems;

  Future<String> loadJson() async => await DefaultAssetBundle.of(context)
      .loadString('assets/data/' + this._mantraFile);

  @override
  void initState() {
    _future = loadJson();
    super.initState();
  }

  final title = 'మంత్ర సమాహారము';

  _LandingPage(this._mantraFile);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          elevation: 0.1,
          backgroundColor: Colors.pink[800],
          title: Text(
            title,
            style: TextStyle(fontFamily: 'NTR', color: Colors.white),
          ),
/*          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.list),
              onPressed: () {},
            )
          ],*/
        ),
        body: Stack(
          children: <Widget>[
            new Container(
              child: new Center(
                child: new FutureBuilder(
                    future: _future,
                    builder: (context, snapshot) {
                      var menus = json.decode(snapshot.data.toString());

                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return Center(
                            child: ColorLoader3(
                                radius: 30,
                                dotRadius: 10,
                                height: 100,
                                width: 100),
                          );
                        default:
                          if (snapshot.hasData) {
                            return GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: menus.length,
                              gridDelegate:
                                  new SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                    child: new CircleIcon(
                                        iconImage: menus[index]['iconImage'],
                                        iconText: menus[index]['iconText']),
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              ListPage(
                                                  mantras: MenuItem.fromJson(
                                                          menus[index])
                                                      .mantras,
                                                  title: menus[index]
                                                      ['iconText']),
                                        )));
                              },
                            );
                          } else {
                            new CircularProgressIndicator();
                          }
                      }
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
