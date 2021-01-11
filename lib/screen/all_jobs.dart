import 'package:flutter/material.dart';

import '../widgets/job_item.dart';
import '../helper/dbHelper.dart';
import '../model/model.dart';
import 'dart:io';

class AllJobs extends StatefulWidget {
  @override
  _AllJobsState createState() => _AllJobsState();
}

class _AllJobsState extends State<AllJobs> {
  int jobItemLenth;

  void setLength(int jobLength) {
    //  setState(() {
    jobItemLenth = jobLength;
    //  });
  }

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final mediaHeight = MediaQuery.of(context).size.height;
    final DbJobManager dbJobManager = new DbJobManager();
    List jobList = [];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 6,
          ),
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: mediaWidth * 0.05),
            height: mediaHeight * 0.06,
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
        Container(
          height: mediaHeight * 0.02,
          padding: EdgeInsets.only(left: 10, right: 10), 
          margin: EdgeInsets.only(bottom: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Recent Jobs',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18.0,
                ),
              ),
              Text(
                jobItemLenth.toString() == null ? '' : jobItemLenth.toString(),
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
        // Container(
        //   child: SingleChildScrollView(
        //     child: ListView.builder(
        //       itemCount: 10,
        //       itemBuilder: (ctx, index) => JobItem(),
        //     ),
        //   ),
        // ),
        Container(
            height: mediaHeight * 0.625,
            child: FutureBuilder(
              future: dbJobManager.getJobsList(),
              builder: (context, snapShot) {
                if (snapShot.hasData) {
                  jobList = snapShot.data;
                  setLength(jobList.length);
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: jobList == null ? 0 : jobList.length,
                    itemBuilder: (BuildContext context, int index) {
                      Job jb = jobList[index];
                      print('Single Job Id from All Jobs page is ${jb.id}');
                      return JobItem(
                        index: index,
                        jb: jobList,
                        id: jobList[index].id,
                        name: jb.name,
                        address: jb.address,
                        phoneNumber: jb.phoneNumber,
                        styleName: jb.styleName,
                        styleDescription: jb.styleDescriptn,
                        customerPics: jb.customerPics,
                        styleRefPics: jb.styleRefPics,
                        fabricPics: jb.fabricPics,
                        receivedDate: jb.recievedDate,
                        dueDate: jb.dueDate,
                        fabricTYpe: jb.fabricType,
                        shoulder: jb.shoulder,
                        chest: jb.chest,
                        bust: jb.bust,
                        bustSpan: jb.bustSpan,
                        waist: jb.waist,
                        band: jb.band,
                        hips: jb.hips,
                        shoulderNipple: jb.shoulderNipple,
                        shoulderUnderburst: jb.shoulderUnderburst,
                        halfLength: jb.halfLength,
                        blouseLength: jb.blouseLength,
                        skirtLength: jb.skirtLength,
                        gownLength: jb.gownLength,
                        sleeve: jb.sleeve,
                        armHole: jb.armHole,
                        thighCirc: jb.thighCirc,
                        kneeCirc: jb.kneeCirc,
                        bandKnee: jb.bandKnee,
                        soleCirc: jb.soleCirc,
                        bandSole: jb.bandSole,
                        placeHolder1: jb.placeHolder1,
                        value1: jb.value1,
                        placeHolder2: jb.placeHolder2,
                        value2: jb.value2,
                        placeHolder3: jb.placeHolder3,
                        value3: jb.value3,
                        placeHolder4: jb.placeHolder4,
                        value4: jb.value4,
                        placeHolder5: jb.placeHolder5,
                        value5: jb.value5,
                        placeHolder6: jb.placeHolder6,
                        value6: jb.value6,
                        placeHolder7: jb.placeHolder7,
                        value7: jb.value7,
                        placeHolder8: jb.placeHolder8,
                        value8: jb.value8,
                      );
                    },
                  );
                }
                return Center(
                  child: new CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.black),
                    strokeWidth: 4.0,
                  ),
                );
              },
            )),
      ],
    );
  }
}
