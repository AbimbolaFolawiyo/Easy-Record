import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

import '../screen/job_item_details.dart';
import '../model/model.dart';
import '../helper/dbHelper.dart';
// import 'package:percent_indicator/linear_percent_indicator.dart';

class JobItem extends StatefulWidget {
  final int index;
  final List<Job> jb;
  final int id;
  final String name;
  final String address;
  final String phoneNumber;
  final String styleName;
  final String styleDescription;
  final String customerPics;
  final String styleRefPics;
  final String fabricPics;
  final String receivedDate;
  final String dueDate;
  final String fabricTYpe;
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

  JobItem({
    this.index,
    this.jb,
    this.id,
    this.name,
    this.address,
    this.phoneNumber,
    this.styleName,
    this.styleDescription,
    this.customerPics,
    this.styleRefPics,
    this.fabricPics,
    this.receivedDate,
    this.dueDate,
    this.fabricTYpe,
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

  @override
  _JobItemState createState() => _JobItemState();
}

class _JobItemState extends State<JobItem> {
  _buildJobDetailsPage(BuildContext context) {
    print('Job Details Id is ${widget.id}');
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => JobsDetailsScreen(
          id: widget.id,
          name: widget.name,
          address: widget.address,
          phoneNumber: widget.phoneNumber,
          styleName: widget.styleName,
          styleDescription: widget.styleDescription,
          customerPics: widget.customerPics,
          styleRefPics: widget.styleRefPics,
          fabricPics: widget.fabricPics,
          receivedDate: widget.receivedDate,
          dueDate: widget.dueDate,
          fabricTYpe: widget.fabricTYpe,
          shoulder: widget.shoulder,
          chest: widget.chest,
          bust: widget.bust,
          bustSpan: widget.bustSpan,
          waist: widget.waist,
          band: widget.band,
          hips: widget.hips,
          shoulderNipple: widget.shoulderNipple,
          shoulderUnderburst: widget.shoulderUnderburst,
          halfLength: widget.halfLength,
          blouseLength: widget.blouseLength,
          skirtLength: widget.skirtLength,
          gownLength: widget.gownLength,
          sleeve: widget.sleeve,
          armHole: widget.armHole,
          thighCirc: widget.thighCirc,
          kneeCirc: widget.kneeCirc,
          bandKnee: widget.bandKnee,
          soleCirc: widget.soleCirc,
          bandSole: widget.bandSole,
          placeHolder1: widget.placeHolder1,
          value1: widget.value1,
          placeHolder2: widget.placeHolder2,
          value2: widget.value2,
          placeHolder3: widget.placeHolder3,
          value3: widget.value3,
          placeHolder4: widget.placeHolder4,
          value4: widget.value4,
          placeHolder5: widget.placeHolder5,
          value5: widget.value5,
          placeHolder6: widget.placeHolder6,
          value6: widget.value6,
          placeHolder7: widget.placeHolder7,
          value7: widget.value7,
          placeHolder8: widget.placeHolder8,
          value8: widget.value8,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    DbJobManager dbJobManager = new DbJobManager();
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.3,
      child: InkWell(
        onTap: () {
          _buildJobDetailsPage(context);
        },
        child: Container(
          height: 355,
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              offset: Offset(0, 9),
              blurRadius: 20,
              spreadRadius: 1,
            ),
          ]),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CustomerInforWithCompletedButton(
                      name: widget.name,
                      customerPics: widget.customerPics,
                      phoneNumber: widget.phoneNumber,
                    ),
                    StylePic(
                      stylePics: widget.styleRefPics.toString(),
                    ),
                    Description(
                      description: widget.styleDescription,
                    ),
                    ProgressIndicator(
                        receivedDate: DateTime.parse(widget.receivedDate),
                        dueDate: DateTime.parse(widget.dueDate)),
                    // BuildLineIndicator(),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 4.0),
                height: 345,
                width: 5,
                color: Colors.black45,
              ),
            ],
          ),
        ),
      ),
      secondaryActions: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconSlideAction(
                caption: 'Edit',
                color: Colors.white38,
                icon: Icons.edit,
                foregroundColor: Colors.greenAccent,
                onTap: () {},
              ),
              IconSlideAction(
                caption: 'Delete',
                color: Colors.white38,
                foregroundColor: Colors.redAccent,
                icon: Icons.delete,
                onTap: () {
                  print('Job is ${widget.jb}');
                  print('Job index is ${widget.index}');
                  print('Job id is ${widget.id}');
                  dbJobManager.deleteJobItem(widget.id);
                  setState(() {
                    widget.jb.removeAt(widget.index);
                    print('New job is${widget.jb}');
                  });
                },
              ),
              IconSlideAction(
                caption: 'Details',
                color: Colors.white38,
                icon: Icons.info,
                foregroundColor: Colors.blueAccent,
                onTap: () {},
              ),
            ],
          ),
        )
      ],
    );
  }
}

class Description extends StatelessWidget {
  final String description;

  Description({this.description});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Description: '),
          Text(description == null ? 'no description added!' : description)
        ],
      ),
    );
  }
}

class StylePic extends StatelessWidget {
  final String stylePics;

  StylePic({this.stylePics});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 350,
      child: Image.file(
        File(stylePics),
        fit: BoxFit.cover,
        // width: 200,
        // height: 200,
      ),
    );
  }
}

class CustomerInforWithCompletedButton extends StatelessWidget {
  final String customerPics;
  final String name;
  final String phoneNumber;

  CustomerInforWithCompletedButton(
      {this.customerPics, this.name, this.phoneNumber});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: CircleAvatar(
            backgroundImage: FileImage(
          File(customerPics),
        )),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(name == null ? 'nill' : name),
            Text(phoneNumber == null ? 'nill' : phoneNumber,
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.grey,
                  fontSize: 15,
                )),
          ],
        ),
        trailing: IconButton(
            icon: Icon(Icons.check_circle_outline), onPressed: () {}),
      ),
    );
  }
}

class ProgressIndicator extends StatefulWidget {
  final DateTime receivedDate;
  final DateTime dueDate;

  ProgressIndicator({this.receivedDate, this.dueDate});

  @override
  _ProgressIndicatorState createState() => _ProgressIndicatorState();
}

class _ProgressIndicatorState extends State<ProgressIndicator> {
  String interval;
  String _calcDaysLeft(
      BuildContext context, DateTime firstDate, DateTime secondDate) {
    int _daysLeft = secondDate.difference(firstDate).inDays;
    setState(() {
      interval = _daysLeft.toString();
    });
    return interval.toString();
  }

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: <Widget>[
          LiquidLinearProgressIndicator(
            value: 0.25,
            backgroundColor: Colors.white,
            borderColor: Colors.red,
            borderWidth: 2.0,
            borderRadius: 12.0,
            valueColor: AlwaysStoppedAnimation(Colors.black),
            center: Text('${ _calcDaysLeft(context, widget.receivedDate, widget.dueDate)} days left'),
            direction: Axis.vertical,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                DateFormat.yMMMEd().format(widget.receivedDate).toString(),
              ),
              Text(
                _calcDaysLeft(context, widget.receivedDate, widget.dueDate),
              ),
              Text(
                DateFormat.yMMMEd()
                    .format(
                      widget.dueDate,
                    )
                    .toString(),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class BuildLineIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    height: 16,
                    width: 16,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.lightBlueAccent,
                        width: 4,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  height: 3,
                  color: Colors.black54,
                ),
              ),
              Column(children: <Widget>[
                Container(
                  height: 16,
                  width: 16,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.lightGreenAccent,
                      width: 4,
                    ),
                  ),
                ),
              ])
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Recieved Date'),
              Text('Interval in Days'),
              Text('Due Date'),
            ],
          ),
        ],
      ),
    );
  }
}
