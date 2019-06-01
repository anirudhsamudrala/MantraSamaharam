import 'package:flutter/material.dart';

class CircleIcon extends StatefulWidget {

  final String iconImage;
  final String iconText;


  const CircleIcon({Key key, this.iconImage,this.iconText}) : super(key: key);
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
                backgroundImage: AssetImage(widget.iconImage),radius: 40),
            SizedBox(height: 10),
            Text(
              widget.iconText,
              style: TextStyle(color: Colors.black38),
            ),
          ],
        ),
      ),
    );
  }
}
