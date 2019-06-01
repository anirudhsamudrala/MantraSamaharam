import 'package:flutter/material.dart';

class CircleIcon extends StatefulWidget {
  CircleIcon({Key key}) : super(key: key);

  @override
  _CircleIcon createState() => new _CircleIcon();
}

class _CircleIcon extends State<CircleIcon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
                backgroundImage: AssetImage("assets/images/om.jpg"),
                radius: 40),
            SizedBox(height: 10),
            Text(
              "Chocolate",
              style: TextStyle(color: Colors.black38),
            ),
          ],
        ),
      ),
    );
  }
}
