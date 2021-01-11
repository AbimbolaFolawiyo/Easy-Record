import 'package:flutter/material.dart';

import '../screen/gallery_details.dart';

class GalleryItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => GalleryDetails(
              name: 'customer name', image: 'assets/images/ankara.png'))),
      child: Container(
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child:
                  //  userJobs[index].styleRefPics == null
                  //     ? Image.asset(
                  //         'assets/images/question1.jpg',
                  //         fit: BoxFit.cover,
                  //         height: 200,
                  //         width: 200,
                  //       )
                  //     :
                  Image.asset(
                'assets/images/ankara.png',
                fit: BoxFit.cover,
                height: 200,
                width: 200,
              ),
            ),
            Positioned(
              bottom: 7,
              right: 5,
              child: Container(
                width: 100,
                height: 30,
                color: Colors.black38,
                child: Column(
                  children: <Widget>[
                    FittedBox(
                        child: Row(
                      children: <Widget>[
                        Text(
                          'Name :',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                        Text(
                          'Customer\'s name',
                          // userJobs[index].name == null
                          //     ? 'nill'
                          //     : userJobs[index].name,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ],
                    )),
                    FittedBox(
                        child: Row(
                      children: <Widget>[
                        Text(
                          'Style :',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                        Text(
                          'Style Name',
                          // userJobs[index].styleName == null
                          //     ? ' nill'
                          //     : userJobs[index].styleName,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
