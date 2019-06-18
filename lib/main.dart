import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/LandingPage.dart';
import 'package:flutter/cupertino.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'మంత్ర సమాహారము';

    return MaterialApp(
      title: title,
      theme: new ThemeData(primaryColor: Colors.amber),
      home:new LandingPage(mantraFile:"telugu.json"),

     /* Scaffold(
        *//*    appBar: AppBar(
          title: Text(title, style: TextStyle(color: Colors.black38)),
        ),*/
      /*
        appBar:
        AppBar(
          elevation: 0.1,
          backgroundColor: Colors.blueGrey,
          title: Text(title,style: TextStyle(fontFamily: 'NTR', color:Colors.white), ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.list),
              onPressed: () {},
            )
          ],
        ),
        body: new Container(
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
      ),*/
    );
  }
}
