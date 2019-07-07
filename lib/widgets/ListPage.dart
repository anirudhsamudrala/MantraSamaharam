import 'package:flutter/material.dart';
import 'package:flutter_app/models/Models.dart';
import 'package:flutter_app/widgets/DetailPage.dart';
import 'package:flutter_app/widgets/LandingPage.dart';
import 'package:share/share.dart';

class ListPage extends StatefulWidget {
  final List<Mantra> mantras;
  final String title;

  ListPage({Key key, this.mantras, this.title}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        {
          Navigator.pop(context);
        }
        break;

      case 1:
        {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LandingPage(mantraFile: "telugu.json")),
          );
        }
        break;

      case 2:
        {
          Share.share(
              'నిత్యం చదువుకోవాల్సిన వివిధ మంత్రాల కొరకు మంత్రం సమాహార అప్ ని డౌన్లోడ్  చేసుకొండ');
        }

        break;
      default:
        {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LandingPage(mantraFile: "telugu.json")),
          );
        }
        break;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(Mantra mantra) => ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
/*      leading: Container(
        padding: EdgeInsets.only(right: 1.0),
        decoration: new BoxDecoration(
            border: new Border(
                right: new BorderSide(width: 1.0, color: Colors.white24))),
        child:
        CircleAvatar(
            backgroundImage: AssetImage(mantra.thumbnail),radius: 30)
        ,
      ),*/
      title: Text(
        mantra.title,
        style: TextStyle(
            fontFamily: "NTR",
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500),
      ),
      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

      subtitle: Row(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Container(
                child: Icon(Icons.spa, color: Colors.pink[700], size: 20.0),
              )),
          Expanded(
            flex: 10,
            child: Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Text(mantra.subtitle,
                    style: TextStyle(
                        fontFamily: "NTR",
                        color: Colors.black54,
                        fontSize: 15))),
          )
        ],
      ),
      trailing: Icon(Icons.launch, color: Colors.black38, size: 25.0),
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
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.0), color: Colors.white),
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
        itemCount: widget.mantras.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(widget.mantras.elementAt(index));
        },
      ),
    );

    final bottomBar = BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.arrow_back),
          title: Padding(padding: EdgeInsets.all(0)),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Padding(padding: EdgeInsets.all(0)),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.share),
          title: Padding(padding: EdgeInsets.all(0)),
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.pink[800],
      onTap: _onItemTapped,
    );

    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Colors.pink[800],
      title: Text(
        widget.title,
        style: TextStyle(
            fontFamily: "NTR",
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500),
      ),
/*      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.list),
          color:Colors.white,
          onPressed: () {},
        )
      ],*/
    );

    return Scaffold(
/*
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
*/
      appBar: topAppBar,
      body: makeBody
      /*,bottomNavigationBar: makeBottom,*/
      ,
      bottomNavigationBar: bottomBar,
    );
  }
}
