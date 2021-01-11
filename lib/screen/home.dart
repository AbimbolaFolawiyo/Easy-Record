import 'package:flutter/material.dart';

import './all_jobs.dart';
import './all_measurements.dart';
import './drawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String filterType = "alljobs";
  changeFilter(String filter) {
    filterType = filter;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: DrawerContent(),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Easy Record',
            style: TextStyle(
              letterSpacing: 3.0,
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            )),
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                // height: 70,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            changeFilter('alljobs');
                          },
                          child: Text(
                            "All Jobs",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 4,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(3),
                              topLeft: Radius.circular(3),
                            ),
                            color: (filterType == "alljobs")
                                ? Colors.black
                                : Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            changeFilter('measurements');
                          },
                          child: Text(
                            "Measurements",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 4,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(3),
                              topLeft: Radius.circular(3),
                            ),
                            color: (filterType == "measurements")
                                ? Colors.black
                                : Colors.transparent,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              (filterType == 'alljobs') ? AllJobs() : AllMeasurements(),
            ],
          ),
        ],
      ),
    );
  }
}
