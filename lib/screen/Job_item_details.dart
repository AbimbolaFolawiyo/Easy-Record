import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';
import 'dart:io';

import '../widgets/fabs_button.dart';
import '../widgets/measurement_info.dart';

class JobsDetailsScreen extends StatefulWidget {
  static const routeName = '/job-details';
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

  JobsDetailsScreen({
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
  _JobsDetailsScreenState createState() => _JobsDetailsScreenState();
}

class _JobsDetailsScreenState extends State<JobsDetailsScreen>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void setState(fn) {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    super.setState(fn);
  }

  void getSelectedJob() {}

  @override
  Widget build(BuildContext context) {
    final questionMark = 'assets/images/question1.jpg';
    _showDeleteWarningDialogue(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Column(
              children: <Widget>[
                Text(
                  'Delete Job',
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
            content: Text(
                'Delete job ? This action also delete this job from completed and bookmarked list.'),
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
                  // Navigator.pop(context);
                  // Navigator.pop(
                  //   context,
                  //   true,
                  // );
                  // widget.deleteJb(
                  //     // jobId,
                  //     );
                },
              )
            ],
          );
        },
      );
    }

    // _showAddCompletedJobWarningDialogue(BuildContext context) {
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return AlertDialog(
    //         title: Column(
    //           children: <Widget>[
    //             Text(
    //               'Add Job',
    //               textAlign: TextAlign.center,
    //               style: TextStyle(
    //                 fontWeight: FontWeight.bold,
    //                 color: Colors.red,
    //               ),
    //             ),
    //             Divider(
    //               thickness: 3,
    //               color: Colors.black,
    //             )
    //           ],
    //         ),
    //         content: (widget.completedAdded(
    //                 // jobId,
    //                 )
    //             ? Text('Remove Job from completed list?')
    //             : Text('Add Job to the completed list?')),
    //         actions: <Widget>[
    //           IconButton(
    //             icon: Icon(
    //               Icons.cancel,
    //               size: 30,
    //               color: Colors.redAccent,
    //             ),
    //             onPressed: () {
    //               Navigator.pop(context);
    //             },
    //           ),
    //           IconButton(
    //             icon: Icon(
    //               Icons.check,
    //               size: 30,
    //               color: Colors.green,
    //             ),
    //             onPressed: () {
    //               Navigator.pop(context);
    //               // Navigator.pop(
    //               //   context,
    //               //   true,
    //               // );
    //               widget.toggleCompleted(
    //                   // jobId,
    //                   );
    //             },
    //           )
    //         ],
    //       );
    //     },
    //   );
    // }

    // _showAddBookmarkedJobWarningDialogue(BuildContext context) {
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return AlertDialog(
    //         title: Column(
    //           children: <Widget>[
    //             Text(
    //               'Add Job',
    //               textAlign: TextAlign.center,
    //               style: TextStyle(
    //                 fontWeight: FontWeight.bold,
    //                 color: Colors.red,
    //               ),
    //             ),
    //             Divider(
    //               thickness: 3,
    //               color: Colors.black,
    //             )
    //           ],
    //         ),
    //         content: widget.isBookMarked(jobId)
    //             ? Text('Remove Job from the BookMarked List? ')
    //             : Text('Add Job to the BookMarked list?'),
    //         actions: <Widget>[
    //           IconButton(
    //             icon: Icon(
    //               Icons.cancel,
    //               size: 30,
    //               color: Colors.redAccent,
    //             ),
    //             onPressed: () {
    //               Navigator.pop(context);
    //             },
    //           ),
    //           IconButton(
    //             icon: Icon(
    //               Icons.check,
    //               size: 30,
    //               color: Colors.green,
    //             ),
    //             onPressed: () {
    //               Navigator.pop(context);
    //               widget.toggleBookMarked(jobId);
    //             },
    //           )
    //         ],
    //       );
    //     },
    //   );
    // }

    // _showSavededJobWarningDialogue(BuildContext context) {
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return AlertDialog(
    //         title: Column(
    //           children: <Widget>[
    //             Text(
    //               'Save Details',
    //               textAlign: TextAlign.center,
    //               style: TextStyle(
    //                 fontWeight: FontWeight.bold,
    //                 color: Colors.red,
    //               ),
    //             ),
    //             Divider(
    //               thickness: 3,
    //               color: Colors.black,
    //             )
    //           ],
    //         ),
    //         content: Text('Save measurements for later use?'),
    //         actions: <Widget>[
    //           IconButton(
    //             icon: Icon(
    //               Icons.cancel,
    //               size: 30,
    //               color: Colors.redAccent,
    //             ),
    //             onPressed: () {
    //               Navigator.pop(context);
    //             },
    //           ),
    //           IconButton(
    //             icon: Icon(
    //               Icons.check,
    //               size: 30,
    //               color: Colors.green,
    //             ),
    //             onPressed: () {
    //               Navigator.pop(context);
    //               widget.toogleSaveMeasurements(jobId);
    //             },
    //           )
    //         ],
    //       );
    //     },
    //   );
    // }

    return WillPopScope(
      onWillPop: () {
        return Future.value(true);
      },
      child: Scaffold(
        // appBar: AppBar(
        //   title: FittedBox(
        //     child: Text(name == null ? ' nill' : name,
        //         style: TextStyle(
        //           fontSize: 18,
        //           fontWeight: FontWeight.bold,
        //         )),
        //   ),
        //   actions: <Widget>[],
        // ),
        // drawer: MainDrawer(),
        body: (widget.id.toString()).isEmpty
            ? Container()
            : CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    iconTheme: IconThemeData(color: Colors.black),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    expandedHeight: 450,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text(
                        widget.name,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'QuickSand',
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      background: Hero(
                        tag: widget.id.toString(),
                        child: Container(
                          // child: ClipRRect(
                          // borderRadius: BorderRadius.circular(30),
                          // only(
                          //     topRight: Radius.circular(15),
                          //     bottomLeft: Radius.circular(15)),
                          child: widget.customerPics == null
                              ? Icon(Icons.question_answer)
                              : Image.file(
                                  File(widget.customerPics),
                                  height: 120,
                                  width: 120,
                                  fit: BoxFit.cover,
                                ),
                          // ),
                        ),
                        // ),
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Card(
                          child: Column(
                              //mother colunm
                              children: <Widget>[
                                Divider(color: Colors.black45),
                                Container(
                                  color: Colors.white,
                                  //1st container
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Flexible(
                                        flex: 5,
                                        child: Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Card(
                                                color: Colors.black45,
                                                child: Row(
                                                  children: <Widget>[
                                                    const Icon(
                                                      Icons.person_outline,
                                                      size: 15,
                                                      color: Colors.white,
                                                    ),
                                                    const Text(
                                                      'Customer Information - ',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                // height: 90,
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 2),
                                                  margin: EdgeInsets.symmetric(
                                                    horizontal: 2,
                                                  ),
                                                  color: Colors.white,
                                                  child: Column(
                                                    // mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Column(
                                                        children: <Widget>[
                                                          FittedBox(
                                                              child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: <Widget>[
                                                              Text('Name: ',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontFamily:
                                                                          'RobotoCondensed',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                              Text(
                                                                  // name == null
                                                                  //     ? 'nill'
                                                                  //     :
                                                                  widget.name,
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Colors
                                                                          .grey))
                                                            ],
                                                          )),
                                                        ],
                                                      ),
                                                      Column(
                                                        children: <Widget>[
                                                          FittedBox(
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: <
                                                                  Widget>[
                                                                Text(
                                                                  'Phone Number: ',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontFamily:
                                                                          'RobotoCondensed',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                Text(
                                                                    // phoneN == null
                                                                    //     ? 'nill'
                                                                    //     :
                                                                    widget.phoneNumber ==
                                                                            null
                                                                        ? '0'
                                                                        : widget
                                                                            .phoneNumber,
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color: Colors
                                                                            .grey)),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        children: <Widget>[
                                                          FittedBox(
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: <
                                                                  Widget>[
                                                                Text(
                                                                  'Address : ',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontFamily:
                                                                          'RobotoCondensed',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                Text(
                                                                  widget.address ==
                                                                          null
                                                                      ? 'nill'
                                                                      : widget
                                                                          .address,
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Colors
                                                                          .grey),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                    color: Colors.black,
                                    indent: 10,
                                    endIndent: 10),
                                Container(
                                  // color: Colors.black,
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        // color: Colors.black,
                                        child: Flexible(
                                          flex: 4,
                                          child: Container(
                                            color: Colors.white,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Card(
                                                  color: Colors.black45,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      const Icon(
                                                        Icons.calendar_today,
                                                        size: 15,
                                                        color: Colors.white,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      const Text(
                                                        'Date',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                      horizontal: 3,
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Row(
                                                          children: <Widget>[
                                                            FittedBox(
                                                              child: const Text(
                                                                'Rec. Date : ',
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                            ),
                                                            FittedBox(
                                                              child: Text(
                                                                widget.receivedDate ==
                                                                        null
                                                                    ? DateFormat
                                                                            .yMMMEd()
                                                                        .format(DateTime
                                                                            .now())
                                                                    : DateFormat
                                                                            .yMMMEd()
                                                                        .format(
                                                                            DateTime.parse(widget.receivedDate)),
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .grey),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        Row(
                                                          children: <Widget>[
                                                            const Text(
                                                              'Due Date : ',
                                                              style: TextStyle(
                                                                // color: Colors.red,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ),
                                                            Text(
                                                              widget.dueDate ==
                                                                      null
                                                                  ? DateFormat
                                                                          .yMMMEd()
                                                                      .format(DateTime
                                                                          .now())
                                                                  : DateFormat
                                                                          .yMMMEd()
                                                                      .format(DateTime.parse(
                                                                          widget
                                                                              .dueDate)),
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .grey),
                                                            )
                                                          ],
                                                        ),
                                                        Row(
                                                          children: <Widget>[
                                                            Text(
                                                              'Days Left : ',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                            Text('days left',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey))
                                                          ],
                                                        ),
                                                      ],
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ),
                                    // // );
                                    // },
                                  ),
                                ),

                                ListTile(
                                  leading: FloatingActionButton(
                                    onPressed: () async {
                                      final url = 'tel:${widget.phoneNumber}';
                                      if (await canLaunch(url)) {
                                        await launch(url);
                                      } else {
                                        throw 'Could not launch!';
                                      }
                                    },
                                    splashColor: Colors.black26,
                                    heroTag: 'one',
                                    backgroundColor: Colors.green,
                                    mini: true,
                                    child: Icon(
                                      Icons.phone,
                                      color: Colors.white,
                                    ),
                                  ),
                                  title: FloatingActionButton(
                                    onPressed: () async {
                                      final url = 'sms:${widget.phoneNumber}';
                                      if (await canLaunch(url)) {
                                        await launch(url);
                                      } else {
                                        throw 'Could not launch!';
                                      }
                                    },
                                    splashColor: Colors.black26,
                                    heroTag: 'two',
                                    backgroundColor: Colors.blue,
                                    mini: true,
                                    child: Icon(
                                      Icons.message,
                                      color: Colors.white,
                                    ),
                                  ),
                                  trailing:
                                      // Icon(Icons.mic),
                                      InkWell(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(40),
                                      child: Image.asset(
                                          'assets/images/whatsapp1.png',
                                          fit: BoxFit.contain),
                                    ),
                                    splashColor: Colors.black26,
                                    onTap: () async {
                                      final url =
                                          'http://Wa.me/234${widget.phoneNumber}';
                                      if (await canLaunch(url)) {
                                        await launch(url);
                                      } else {
                                        throw 'Could not launch!';
                                      }
                                    },
                                  ),
                                ),
                                Container(
                                  // 2nd Container
                                  color: Colors.white,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                          width: double.infinity,
                                          child: Card(
                                            color: Colors.black45,
                                            child: Row(
                                              children: <Widget>[
                                                const Icon(
                                                  Icons.style,
                                                  size: 15,
                                                  color: Colors.white,
                                                ),
                                                const Text(
                                                  'Style Information - ',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16),
                                                ),
                                              ],
                                            ),
                                          )),
                                      Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        elevation: 4,
                                        margin: EdgeInsets.symmetric(
                                          vertical: 5,
                                          horizontal: 2,
                                        ),
                                        child: Column(
                                          children: <Widget>[
                                            Stack(
                                              children: <Widget>[
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20),
                                                    topRight:
                                                        Radius.circular(20),
                                                  ),
                                                  child: widget.styleRefPics ==
                                                          null
                                                      ? Image.asset(
                                                          questionMark,
                                                          height: 350,
                                                          width:
                                                              double.infinity,
                                                          fit: BoxFit.cover,
                                                        )
                                                      : Image.file(
                                                          File(widget
                                                              .styleRefPics),
                                                          height: 350,
                                                          width:
                                                              double.infinity,
                                                          fit: BoxFit.cover,
                                                        ),
                                                ),
                                                Positioned(
                                                  bottom: 7,
                                                  right: 5,
                                                  child: Container(
                                                    width: 150,
                                                    height: 45,
                                                    color: Colors.black38,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal: 3,
                                                      vertical: 6,
                                                    ),
                                                    child: FittedBox(
                                                      child: Text(
                                                        widget.styleName == null
                                                            ? 'nill'
                                                            : widget.styleName,
                                                        style: TextStyle(
                                                          fontSize: 8,
                                                          color: Colors.white,
                                                        ),
                                                        softWrap: true,
                                                        overflow:
                                                            TextOverflow.fade,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 2,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                    ),
                                                    child: Text(
                                                        'Style Description : ',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              'RobotoCondensed',
                                                          color: Colors.black,
                                                        )),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      border: Border.all(
                                                          color: Colors.grey),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    margin: EdgeInsets.all(1),
                                                    padding: EdgeInsets.all(2),
                                                    height: 90,
                                                    width: double.infinity,
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Text(
                                                        widget.styleDescription ==
                                                                null
                                                            ? 'nill'
                                                            : widget
                                                                .styleDescription,
                                                        style: TextStyle(
                                                            color: Colors.grey),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Container(
                                Divider(color: Colors.black),
                                Container(
                                  // 3rd Container
                                  color: Colors.white,
                                  child: Column(
                                    children: <Widget>[
                                      Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        elevation: 4,
                                        margin: EdgeInsets.symmetric(
                                          vertical: 5,
                                          horizontal: 2,
                                        ),
                                        child: Column(
                                          children: <Widget>[
                                            Stack(
                                              children: <Widget>[
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                    topRight:
                                                        Radius.circular(15),
                                                  ),
                                                  child: widget.fabricPics ==
                                                          null
                                                      ? Image.asset(
                                                          questionMark,
                                                          height: 200,
                                                          width:
                                                              double.infinity,
                                                          fit: BoxFit.cover,
                                                        )
                                                      : Image.file(
                                                          File(widget
                                                              .fabricPics),
                                                          height: 200,
                                                          width:
                                                              double.infinity,
                                                          fit: BoxFit.cover,
                                                        ),
                                                ),
                                                Positioned(
                                                  bottom: 7,
                                                  right: 5,
                                                  child: Container(
                                                    width: 150,
                                                    height: 45,
                                                    color: Colors.black38,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal: 3,
                                                      vertical: 6,
                                                    ),
                                                    child: FittedBox(
                                                      child: Text(
                                                        widget.fabricTYpe ==
                                                                null
                                                            ? 'nill'
                                                            : widget.fabricTYpe,
                                                        style: TextStyle(
                                                          fontSize: 8,
                                                          color: Colors.white,
                                                        ),
                                                        softWrap: true,
                                                        overflow:
                                                            TextOverflow.fade,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              color: Colors.white,
                                              width: double.infinity,
                                              child: Card(
                                                color: Colors.black45,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    const Icon(
                                                      Icons.line_style,
                                                      size: 15,
                                                      color: Colors.white,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    const Text(
                                                      'Measurement Information - ',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            MeasurementInfoOnJobDetailsScreen(
                                              widget.shoulder,
                                              widget.chest,
                                              widget.bust,
                                              widget.bustSpan,
                                              widget.band,
                                              widget.waist,
                                              widget.hips,
                                              widget.shoulderNipple,
                                              widget.shoulderUnderburst,
                                              widget.halfLength,
                                              widget.blouseLength,
                                              widget.skirtLength,
                                              widget.gownLength,
                                              widget.sleeve,
                                              widget.armHole,
                                              widget.thighCirc,
                                              widget.kneeCirc,
                                              widget.bandKnee,
                                              widget.soleCirc,
                                              widget.bandSole,
                                              widget.placeHolder1,
                                              widget.value1,
                                              widget.placeHolder2,
                                              widget.value2,
                                              widget.placeHolder3,
                                              widget.value3,
                                              widget.placeHolder4,
                                              widget.value4,
                                              widget.placeHolder5,
                                              widget.value5,
                                              widget.placeHolder6,
                                              widget.value6,
                                              widget.placeHolder7,
                                              widget.value7,
                                              widget.placeHolder8,
                                              widget.value8,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(color: Colors.black),
                              ]),
                          // Container(
                          //   // color: Theme.of(context).primaryColor,
                          //   child: Card(
                          //     color: Theme.of(context).primaryColor,
                          //     child: Row(
                          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //       children: <Widget>[
                          //         IconButton(
                          //           color: Colors.white,
                          //           icon: Icon(
                          //             widget.isBookMarked(jobId)
                          //                 ? Icons.bookmark
                          //                 : Icons.bookmark_border,
                          //           ),
                          //           onPressed: () =>
                          //               _showAddBookmarkedJobWarningDialogue(
                          //                   context),
                          //         ),
                          //         IconButton(
                          //           color: Colors.white,
                          //           icon: Icon(Icons.edit),
                          //           onPressed: () =>
                          //               update(context, jobId, jobIndex),
                          //           // showModalBottomSheet(
                          //           //     context: context,
                          //           //     builder: (_) {
                          //           //       return GestureDetector(
                          //           //         onTap: () {},
                          //           //         child: UpdateJobPage(
                          //           //           editedJobId: jobId,
                          //           //           index: jobIndex,
                          //           //         ),
                          //           //       );
                          //           //     });
                          //           // Navigator.of(context).push(
                          //           //   MaterialPageRoute(
                          //           //     builder: (BuildContext context) {
                          //           //       return JobEditScreen(jobId);
                          //           //   },
                          //           // ),
                          //           // );
                          //         ),
                          //         IconButton(
                          //           color: Colors.white,
                          //           icon: Icon(Icons.save),
                          //           onPressed: () =>
                          //               _showSavededJobWarningDialogue(context),
                          //         ),
                          //         IconButton(
                          //           color: Colors.white,
                          //           icon: Icon(
                          //             widget.completedAdded(jobId)
                          //                 ? Icons.check_circle
                          //                 : Icons.check_circle_outline,
                          //           ),
                          //           onPressed: () =>
                          //               _showAddCompletedJobWarningDialogue(
                          //                   context),
                          //         ),
                          //         IconButton(
                          //           color: Colors.white,
                          //           icon: Icon(Icons.delete),
                          //           onPressed: () =>
                          //               _showDeleteWarningDialogue(context),
                          //           //  () => deleteJb(
                          //           //   jobId,
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          //       ],
                          //     ),
                          //   ],
                          // ),
                          // ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

        floatingActionButton: FabsButton(
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
}
