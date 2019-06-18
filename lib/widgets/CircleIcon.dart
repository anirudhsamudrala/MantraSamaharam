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
                backgroundImage: AssetImage(widget.iconImage),radius: 38),
            SizedBox(height: 10),
            Text(
          widget.iconText,
          textAlign: TextAlign.center,
          softWrap: true,
          style: TextStyle(color: Colors.black,fontSize: 16, fontWeight: FontWeight.w500),
        ),
          ],
        ),
      ),
    );
  }
}
