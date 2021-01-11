import 'package:flutter/material.dart';

class GalleryDetails extends StatelessWidget {
  final String image;
  final String name;

  GalleryDetails({this.name, this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage(image),
          // colorFilter:
          //     ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.darken),
        ),
      ),
      child: Column(
        children: <Widget>[
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(name, style: TextStyle(color: Colors.white)),
          ),
          Spacer(),
          Container(
              padding: EdgeInsets.only(bottom: 15),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  FlatButton(
                    onPressed: () {},
                    child: Icon(Icons.delete, size: 30, color: Colors.white),
                  ),
                  // Text('Delete', style: TextStyle(color: Colors.white, ))
                ],
              )),
          // Container(
          //   alignment: Alignment.bottomCenter,
          //   color: Colors.transparent,
          //   child: IconButton(
          //     icon: Icon(Icons.delete_forever),
          //     color: Colors.white,
          //     onPressed: () {},
          //   ),
          // )
        ],
      ),
    );
  }
}
