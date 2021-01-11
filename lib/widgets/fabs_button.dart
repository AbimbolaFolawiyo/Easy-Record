import 'package:flutter/material.dart';

import './edit_job.dart';
import '../helper/dbHelper.dart';
import '../model/model.dart';

class FabsButton extends StatefulWidget {
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

  FabsButton({
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
  // final String jobId;
  // final jobIndex;
  // final Function showDeleteWarningDialogue;
  // final Function showCompletedWarningDialogue;
  // final Function showSavedJobWariningDialogue;
  // final Function completedAdded;
  // final Function update;
  // final Function showBookmarkedJobWarningDialogue;
  // final Function isBookmarked;

  // FabsButton({
  //   this.showDeleteWarningDialogue,
  //   this.showSavedJobWariningDialogue,
  //   this.showCompletedWarningDialogue,
  //   this.completedAdded,
  //   this.update,
  //   this.showBookmarkedJobWarningDialogue,
  //   this.isBookmarked,
  //   this.jobId,
  //   this.jobIndex,
  // });
  @override
  _FabsButtonState createState() => _FabsButtonState();
}

class _FabsButtonState extends State<FabsButton> with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 400,
      ),
    );
    super.initState();
  }

  _showAddEditJobJobWarningDialogue(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            children: <Widget>[
              Text(
                'Edit Job',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              Divider(
                thickness: 3,
                color: Colors.black,
              )
            ],
          ),
          content: Text('Change some of this Job details?'),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.cancel,
                size: 30,
                color: Colors.redAccent,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.check,
                size: 30,
                color: Colors.green,
              ),
              onPressed: () {
                Navigator.pop(context);

                // widget.update(context, widget.jobId, widget.jobIndex);
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    DbJobManager dbJobManager = new DbJobManager();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // ScaleTransition(
        //   scale: CurvedAnimation(
        //     parent: _controller,
        //     curve: Interval(0.0, 1.0, curve: Curves.easeOut),
        //   ),
        //   child: Container(
        //     height: 70,
        //     width: 56,
        //     alignment: FractionalOffset.topCenter,
        //     child: FloatingActionButton(
        //       backgroundColor: Colors.black54,
        //       onPressed: () {
        //         // widget.showBookmarkedJobWarningDialogue(context);
        //       },
        //       mini: true,
        //       heroTag: 'BookMark',
        //       child: Icon(
        //         // widget.isBookmarked(widget.jobId)
        //         //     ? Icons.bookmark
        //         //     :
        //             Icons.bookmark_border,
        //         color: Colors.blueAccent,
        //       ),
        //     ),
        //   ),
        // ),
        ScaleTransition(
          scale: CurvedAnimation(
            parent: _controller,
            curve: Interval(0.0, 0.8, curve: Curves.easeOut),
          ),
          child: Container(
            height: 70,
            width: 56,
            alignment: FractionalOffset.topCenter,
            child: FloatingActionButton(
              backgroundColor: Colors.black54,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EditJob(
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
              },
              mini: true,
              heroTag: 'Edit',
              child: Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
          ),
        ),
        ScaleTransition(
          scale: CurvedAnimation(
            parent: _controller,
            curve: Interval(0.0, 0.4, curve: Curves.easeOut),
          ),
          child: Container(
            height: 70,
            width: 56,
            alignment: FractionalOffset.topCenter,
            child: FloatingActionButton(
              backgroundColor: Colors.black54,
              onPressed: () {
                // widget.showCompletedWarningDialogue(context);
              },
              mini: true,
              heroTag: 'Delete',
              child: Icon(
                // widget.completedAdded(widget.jobId)
                //     ? Icons.check_circle
                //     :
                Icons.check_circle_outline,
                color: Colors.green,
              ),
            ),
          ),
        ),
        ScaleTransition(
          scale: CurvedAnimation(
            parent: _controller,
            curve: Interval(0.0, 0.4, curve: Curves.easeOut),
          ),
          child: Container(
            height: 70,
            width: 56,
            alignment: FractionalOffset.topCenter,
            child: FloatingActionButton(
              backgroundColor: Colors.black54,
              onPressed: () {
                dbJobManager.deleteJobItem(widget.id);
                Navigator.of(context).pop();
                print('Deleted Job Id is ${widget.id}');
                // widget.showDeleteWarningDialogue(context);
              },
              mini: true,
              heroTag: 'tag 4',
              child: Icon(
                Icons.delete_forever,
                color: Colors.redAccent,
              ),
            ),
          ),
        ),
        FloatingActionButton(
          onPressed: () {
            if (_controller.isDismissed) {
              _controller.forward();
            } else {
              _controller.reverse();
            }
          },
          backgroundColor: Colors.black54,
          heroTag: 'tag 5',
          child: Icon(
            Icons.expand_less,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
