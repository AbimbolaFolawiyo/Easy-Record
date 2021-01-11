import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateDisplay extends StatefulWidget {
  DateTime recievedSelectedDate;
  DateTime dueSelectedDate;
  int interval;

  DateDisplay(this.recievedSelectedDate, this.dueSelectedDate, this.interval);
  @override
  _DateDisplayState createState() => _DateDisplayState();
}

class _DateDisplayState extends State<DateDisplay> {
  String _calcDaysLeft(
      BuildContext context, DateTime firstDate, DateTime secondDate) {
    int _daysLeft = secondDate.difference(firstDate).inDays;
    setState(() {
      widget.interval = _daysLeft;
    });
    setState(() {
      
    });
    return widget.interval.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Row(
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
                  height: 4,
                  color: Colors.black45,
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
        ),
        Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
                'Job Recieved date: ' +
                    '${DateFormat.yMMMEd().format(widget.recievedSelectedDate)}',
                style: TextStyle(fontSize: 18)),
            Text(
                'Job Due date: ' +
                    '${DateFormat.yMMMEd().format(widget.dueSelectedDate)}',
                style: TextStyle(fontSize: 18)),
            Text(
                'Interval in days: ' + 
                    '${_calcDaysLeft(context, widget.recievedSelectedDate, widget.dueSelectedDate)}',
                style: TextStyle(fontSize: 18)),
          ],
        )),
      ],
    );
  }
}
