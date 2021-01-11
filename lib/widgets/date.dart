import 'package:flutter/material.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;

class DatePicker extends StatefulWidget {
  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime _receivedSelectedDate = DateTime.now();
  DateTime _dueSelectedDate = DateTime.now().add(Duration(days: 3));

  Future displayDateRangePicker(BuildContext context) async {
    final List<DateTime> picked = await DateRagePicker.showDatePicker(
        context: context,
        initialFirstDate: _receivedSelectedDate,
        initialLastDate: _dueSelectedDate,
        firstDate: new DateTime(DateTime.now().year - 20),
        lastDate: new DateTime(DateTime.now().year + 20));
    if (picked != null && picked.length == 2) {
      setState(() {
        _receivedSelectedDate = picked[0];
        _dueSelectedDate = picked[1];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          RaisedButton(
              child: Text('Date Picker'),
              onPressed: () async {
                await displayDateRangePicker(context);
              }),
          SizedBox(
            height: 20,
          ),
          Text(
            _receivedSelectedDate.toString(),
          ),
        ],
      ),
    ));
  }
}
