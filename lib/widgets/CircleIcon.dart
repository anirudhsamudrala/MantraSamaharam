import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mantra_samahara/widgets/Loader.dart';

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
            CachedNetworkImage(
/*             imageUrl:"https://firebasestorage.googleapis.com/v0/b/mantrasamahara.appspot.com/o/MantraSamahara%2Fdevi_2.jpg?alt=media&token=770eb308-b448-4367-a359-8d4b7ce2d489",*/
                imageUrl: widget.iconImage,
                imageBuilder: (context, imageProvider) => Container(
                      width: 75.0,
                      height: 75.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                      ),
                    ),
                placeholder: (context, url) => ColorLoader3(
                    radius: 15, dotRadius: 6, width: 15, height: 15),
                errorWidget: (context, url, error) =>
                    /*Icon(Icons.error),*/
                    CircleAvatar(
                        backgroundImage: AssetImage("assets/images/pooja.png"),
                        /* fall back image */
                        radius: 38)),
/*
            SizedBox(height: 20),
*/
            Text(
              widget.iconText,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "NTR",
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
              overflow: TextOverflow.fade,
              maxLines: 1,
              softWrap: false,
            ),
          ],
        ),
      ),
    );
  }
}
