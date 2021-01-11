import 'package:easy_record/model/model.dart';
import 'package:flutter/material.dart';

import '../widgets/add_measurement.dart';
import '../widgets/measurement_item.dart';
import '../helper/dbHelper.dart';

class AllMeasurements extends StatefulWidget {
  @override
  _AllMeasurementsState createState() => _AllMeasurementsState();
}

class _AllMeasurementsState extends State<AllMeasurements> {
  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final mediaHeight = MediaQuery.of(context).size.height;
    final DbMeasrementManager dbMeasrementManager = new DbMeasrementManager();
    List measurementList = [];
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 5,
                          color: Colors.black.withOpacity(0.23),
                        )
                      ]),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: TextField(
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {},
                            color: Colors.grey,
                          ),
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none),
                    ),
                  ),
                ),
              ),
              // Container(
              //   height: 40,
              //   width: MediaQuery.of(context).size.width * 0.8,
              //   child: TextField(
              //     style: TextStyle(color: Colors.black),
              //     cursorColor: Colors.black,
              //     decoration: InputDecoration(
              //         border: InputBorder.none,
              //         fillColor: Colors.black12,
              //         filled: true,
              //         hintText: 'Search',
              //         hintStyle: TextStyle(color: Colors.black),
              //         prefixIcon:
              //             Icon(Icons.search, color: Colors.black, size: 26.0),
              //         enabledBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(30.0),
              //         )),
              //   ),
              // ),
              IconButton(
                icon: Icon(Icons.add),
                iconSize: 28,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => AddNewMeasurement()));
                },
              )
            ],
          ),
        ),
        Container(
          height: mediaHeight * 0.65,
          child: FutureBuilder(
            future: dbMeasrementManager.getMeasurementList(),
            builder: (context, snapShot) {
              if (snapShot.hasData) {
                measurementList = snapShot.data;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount:
                      measurementList == null ? 0 : measurementList.length,
                  itemBuilder: (BuildContext context, int index) {
                    Measurement m = measurementList[index];
                    return MeasurementItem(
                      id: m.id,
                      name: m.name,
                      address: m.address,
                      phoneNumber: m.phoneNumber,
                      customerPics: m.customerPics,
                      receivedDate: m.recievedDate,
                      shoulder: m.shoulder,
                      chest: m.chest,
                      bust: m.bust,
                      bustSpan: m.bustSpan,
                      waist: m.waist,
                      band: m.band,
                      hips: m.hips,
                      shoulderNipple: m.shoulderNipple,
                      shoulderUnderburst: m.shoulderUnderburst,
                      halfLength: m.halfLength,
                      blouseLength: m.blouseLength,
                      skirtLength: m.skirtLength,
                      gownLength: m.gownLength,
                      sleeve: m.sleeve,
                      armHole: m.armHole,
                      thighCirc: m.thighCirc,
                      kneeCirc: m.kneeCirc,
                      bandKnee: m.bandKnee,
                      soleCirc: m.soleCirc,
                      bandSole: m.bandSole,
                      placeHolder1: m.placeHolder1,
                      value1: m.value1,
                      placeHolder2: m.placeHolder2,
                      value2: m.value2,
                      placeHolder3: m.placeHolder3,
                      value3: m.value3,
                      placeHolder4: m.placeHolder4,
                      value4: m.value4,
                      placeHolder5: m.placeHolder5,
                      value5: m.value5,
                      placeHolder6: m.placeHolder6,
                      value6: m.value6,
                      placeHolder7: m.placeHolder7,
                      value7: m.value7,
                      placeHolder8: m.placeHolder8,
                      value8: m.value8,
                    );
                  },
                );
              }
              return Center(
                  child: new CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.black),
                strokeWidth: 4.0,
              ));
            },
          ),
        ),
      ],
    );
  }
}
