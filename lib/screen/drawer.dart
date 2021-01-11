import 'package:flutter/material.dart';

class DrawerContent extends StatelessWidget {
  int id = 1;
  DrawerContent({
    this.id,
  });
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          automaticallyImplyLeading: false,
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          expandedHeight: MediaQuery.of(context).size.height * 0.3,
          flexibleSpace: FlexibleSpaceBar(
            background: Hero(
              tag: id.toString(),
              child: Container(
                child: Image.asset('assets/images/fola.jpeg',
                    height: 100, width: 100, fit: BoxFit.cover),
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(
                          'Intellect Technologies',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.edit,
                          ),
                        ),
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  ListTile(
                    title: Text('All Recorded Jobs : '),
                    subtitle: Text('100'),
                  ),
                  ListTile(
                    title: Text('All Recorded Measurements : '),
                    subtitle: Text('100'),
                  ),
                  ListTile(
                    title: Text('All Added Pictures : '),
                    subtitle: Text('100'),
                  ),
                  ListTile(
                    title: Text('All Completed Jobs : '),
                    subtitle: Text('100'),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text('Inspired by - '),
                              Spacer(),
                              Icon(
                                Icons.favorite,
                                color: Colors.redAccent,
                                size: 6,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Spacer(),
                              Text(
                                'ADUNNI',
                                style: TextStyle(letterSpacing: 5),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ],
    );
  }
}
