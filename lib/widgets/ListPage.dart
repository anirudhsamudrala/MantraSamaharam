import 'package:flutter/material.dart';
import 'package:flutter_app/models/lesson.dart';
import 'package:flutter_app/widgets/DetailPage.dart';
import 'package:flutter_app/models/Models.dart';
class ListPage extends StatefulWidget {

  final List<Mantra> mantras;
  ListPage({Key key, this.mantras}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(Mantra mantra) => ListTile(
      contentPadding:
      EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
      leading: Container(
        padding: EdgeInsets.only(right: 1.0),
        decoration: new BoxDecoration(
            border: new Border(
                right: new BorderSide(width: 1.0, color: Colors.white24))),
        child: CircleAvatar(
            backgroundImage: AssetImage(mantra.thumbnail),radius: 30),
      ),
      title: Text(
        mantra.title,
        style: TextStyle(color: Colors.black38, fontWeight: FontWeight.w300),
      ),
      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

      subtitle: Row(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Container(
                // tag: 'hero',
                child: LinearProgressIndicator(
                    backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
                    value: 2, /* remove this later*/
                    valueColor: AlwaysStoppedAnimation(Colors.green)),
              )),
          Expanded(
            flex: 4,
            child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(mantra.title,
                    style: TextStyle(color: Colors.black38))),
          )
        ],
      ),
      trailing:
      Icon(Icons.chevron_right, color: Colors.black38, size: 30.0),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(mantra: mantra)));
      },
    );

    Card makeCard(Mantra mantra) => Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(borderRadius:
        BorderRadius.circular(40.0),color: Colors.white),
        child: makeListTile(mantra),

      ),
    );

    final makeBody = Container(
/*
       decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
*/
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: widget.mantras.length ,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(widget.mantras.elementAt(index));
        },
      ),
    );


    final makeBottom = Container(
      height: 55.0,
      child: BottomAppBar(
        color: Color.fromRGBO(58, 66, 86, 1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.blur_on, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.hotel, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.account_box, color: Colors.white),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Colors.amberAccent,
      title: Text("Title New"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.list),
          onPressed: () {},
        )
      ],
    );

    return Scaffold(
/*
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
*/
      appBar: topAppBar,
      body: makeBody,
      bottomNavigationBar: makeBottom,
    );
  }
}
