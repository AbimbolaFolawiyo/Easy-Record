import 'package:flutter/material.dart';
import './add_measurement.dart';

class AddDialogue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;
    return Container(
      height: mediaHeight,
      color: Colors.black.withOpacity(0.3),
      child: Center(
        child: Container(
          height: mediaHeight * 0.2,
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: InkWell(
                  child: Text(
                    'Add New Job',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {},
                ),
              ),
              Divider(
                endIndent: mediaWidth * 0.2,
                indent: mediaWidth * 0.2,
                color: Colors.white,
                thickness: 1.5,
              ),
              Container(
                child: InkWell(
                  child: Text(
                    'Add New Measurement',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => AddNewMeasurement(),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
