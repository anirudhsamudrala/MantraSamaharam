import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CircleIcon extends StatefulWidget {
  final String iconImage;
  final String iconText;

  const CircleIcon({Key key, this.iconImage, this.iconText}) : super(key: key);
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
            /*       CircleAvatar(
                 backgroundImage:AssetImage(widget.iconImage),
           /*child:
                ClipRRect(
                    borderRadius: BorderRadius.circular(45),
                    child: CachedNetworkImage(
                      imageUrl:
                      "https://firebasestorage.googleapis.com/v0/b/mantrasamahara.appspot.com/o/MantraSamahara%2Fdevi_2.jpg?alt=media&token=770eb308-b448-4367-a359-8d4b7ce2d489",
                      placeholder: (context, url) =>
                      new CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                      *//* new Icon(Icons.error),*//*
                      new Image(image: AssetImage("assets/images/sutra.png")),
                    )),*/
                radius: 38),
                */
            CachedNetworkImage(
/*             imageUrl:"https://firebasestorage.googleapis.com/v0/b/mantrasamahara.appspot.com/o/MantraSamahara%2Fdevi_2.jpg?alt=media&token=770eb308-b448-4367-a359-8d4b7ce2d489",*/
                imageUrl: widget.iconImage,
                imageBuilder: (context, imageProvider) => Container(
                      width: 85.0,
                      height: 85.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                      ),
                    ),
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) =>
                    /*Icon(Icons.error),*/
                    CircleAvatar(
                        backgroundImage: AssetImage("assets/images/pooja.png"), /* fall back image */
                        radius: 38)),
            SizedBox(height: 10),
            Text(
              widget.iconText,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "NTR",
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
