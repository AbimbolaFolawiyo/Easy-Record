import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'dart:io';

import './measurement_details.dart';

class MeasurementItem extends StatelessWidget {
  final int id;
  final String name;
  final String address;
  final String phoneNumber;
  final String customerPics;
  final String receivedDate;
  final String shoulder;
  final String chest;
  final String bust;
  final String bustSpan;
  final String waist;
  final String band;
  final String hips;
  final String shoulderNipple;
  final String shoulderUnderburst;
  final String halfLength;
  final String blouseLength;
  final String skirtLength;
  final String gownLength;
  final String sleeve;
  final String armHole;
  final String thighCirc;
  final String kneeCirc;
  final String bandKnee;
  final String soleCirc;
  final String bandSole;
  final String placeHolder1;
  final String value1;
  final String placeHolder2;
  final String value2;
  final String placeHolder3;
  final String value3;
  final String placeHolder4;
  final String value4;
  final String placeHolder5;
  final String value5;
  final String placeHolder6;
  final String value6;
  final String placeHolder7;
  final String value7;
  final String placeHolder8;
  final String value8;

  MeasurementItem({
    this.id,
    this.name,
    this.address,
    this.phoneNumber,
    this.customerPics,
    this.receivedDate,
    this.shoulder,
    this.chest,
    this.bust,
    this.bustSpan,
    this.waist,
    this.band,
    this.hips,
    this.shoulderNipple,
    this.shoulderUnderburst,
    this.halfLength,
    this.blouseLength,
    this.skirtLength,
    this.gownLength,
    this.sleeve,
    this.armHole,
    this.thighCirc,
    this.kneeCirc,
    this.bandKnee,
    this.soleCirc,
    this.bandSole,
    this.placeHolder1,
    this.value1,
    this.placeHolder2,
    this.value2,
    this.placeHolder3,
    this.value3,
    this.placeHolder4,
    this.value4,
    this.placeHolder5,
    this.value5,
    this.placeHolder6,
    this.value6,
    this.placeHolder7,
    this.value7,
    this.placeHolder8,
    this.value8,
  });

  _buildMeasurementDetails(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => MeasrementDetailsScreen(
          id: id,
          name: name,
          address: address,
          phoneNumber: phoneNumber,
          customerPics: customerPics,
          receivedDate: receivedDate,
          shoulder: shoulder,
          chest: chest,
          bust: bust,
          bustSpan: bustSpan,
          waist: waist,
          band: band,
          hips: hips,
          shoulderNipple: shoulderNipple,
          shoulderUnderburst: shoulderUnderburst,
          halfLength: halfLength,
          blouseLength: blouseLength,
          skirtLength: skirtLength,
          gownLength: gownLength,
          sleeve: sleeve,
          armHole: armHole,
          thighCirc: thighCirc,
          kneeCirc: kneeCirc,
          bandKnee: bandKnee,
          soleCirc: soleCirc,
          bandSole: bandSole,
          placeHolder1: placeHolder1,
          value1: value1,
          placeHolder2: placeHolder2,
          value2: value2,
          placeHolder3: placeHolder3,
          value3: value3,
          placeHolder4: placeHolder4,
          value4: value4,
          placeHolder5: placeHolder5,
          value5: value5,
          placeHolder6: placeHolder6,
          value6: value6,
          placeHolder7: placeHolder7,
          value7: value7,
          placeHolder8: placeHolder8,
          value8: value8,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.3,
      child: Card(
        child: ListTile(
            onTap: () {
              _buildMeasurementDetails(context);
            },
            leading: CircleAvatar(
              backgroundImage: FileImage(File(customerPics)),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Text(
                    name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        phoneNumber,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        DateFormat.yMMMEd().format(
                          DateTime.parse(receivedDate),
                        ),
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            trailing: Container(
              padding: EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(2),
                  bottomLeft: Radius.circular(2),
                ),
              ),
              width: 4,
              color: Colors.black,
            )),
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Details',
          icon: Icons.info,
          onTap: () {},
        ),
        IconSlideAction(
          caption: 'Edit',
          icon: Icons.mode_edit,
          onTap: () {},
        ),
        IconSlideAction(
          caption: 'Delete',
          icon: Icons.delete,
          onTap: () {},
        ),
      ],
    );
  }
}
