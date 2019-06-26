import 'package:flutter/material.dart';
import 'package:flutter_app/models/Models.dart';

class DetailPage extends StatelessWidget {
  final Mantra mantra;
  DetailPage({Key key, this.mantra}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 80.0),
        SizedBox(height: 10.0),
        Text(
          mantra.title,
          style:
              TextStyle(fontFamily: "NTR", color: Colors.white, fontSize: 30.0),
        ),
        Container(
          width: 150.0,
          child: new Divider(color: Colors.red),
        ),
        SizedBox(height: 25.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
                flex: 6,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      mantra.subcontent,
                      style: TextStyle(
                          fontFamily: "NTR",
                          color: Colors.white,
                          fontSize: 20.0),
                    )))
          ],
        ),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 10.0),
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage(mantra.thumbnail),
                fit: BoxFit.cover,
              ),
            )),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(10.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 30.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );

    final bottomContentText = Text(
      mantra.content,
      style: TextStyle(fontFamily: "NTR", fontSize: 20.0),
    );
    final bottomContent = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          children: <Widget>[bottomContentText],
        ),
      ),
    );
    return Scaffold(
/*
      appBar:topAppBar,
*/
      body: ListView(
        children: <Widget>[topContent, bottomContent],
      ),
    );
  }
}
