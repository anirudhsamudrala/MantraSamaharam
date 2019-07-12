import 'package:flutter/material.dart';
import 'package:mantra_samahara/models/Models.dart';
import 'package:mantra_samahara/widgets/LandingPage.dart';
import 'package:share/share.dart';

class DetailPage extends StatefulWidget {
  final Mantra mantra;

  DetailPage({Key key, this.mantra}) : super(key: key);

  @override
  _DetailPage createState() => _DetailPage();
}

class _DetailPage extends State<DetailPage> {
  int _selectedIndex = 0;
  ScrollController _scrollController;
  bool _isOnTop = true;

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
              'నిత్యం చదువుకోవాల్సిన వివిధ మంత్రాల కొరకు మంత్రం సమాహార అప్');
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
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  _scrollToTop() {
    _scrollController.animateTo(_scrollController.position.minScrollExtent,
        duration: Duration(milliseconds: 1000), curve: Curves.easeIn);
    setState(() => _isOnTop = true);
  }

  _scrollToBottom() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 1000), curve: Curves.easeOut);
    setState(() => _isOnTop = false);
  }

  @override
  Widget build(BuildContext context) {
    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 80.0),
        SizedBox(height: 10.0),
        Text(
          widget.mantra.title,
          style:
              TextStyle(fontFamily: "NTR", color: Colors.white, fontSize: 30.0),
        ),
        Container(
          width: 150.0,
          child: new Divider(color: Colors.white),
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
                      widget.mantra.subcontent,
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
                image: new NetworkImage(widget.mantra.thumbnail),
                /* image: new AssetImage(mantra.thumbnail),*/
                fit: BoxFit.cover,
              ),
            )),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(10.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
          /* Color.fromRGBO(58, 66, 86, .9)  Color.fromRGBO(173, 20, 87, .9)*/
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
      widget.mantra.content,
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

    return Scaffold(
/*
      appBar:topAppBar,
*/
      body: ListView(
        controller: _scrollController,
        children: <Widget>[topContent, bottomContent],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _isOnTop ? _scrollToBottom : _scrollToTop,
        child: Icon(_isOnTop ? Icons.arrow_downward : Icons.arrow_upward),
        backgroundColor: Colors.pink[700],
      ),
      bottomNavigationBar: bottomBar,
    );
  }
}
