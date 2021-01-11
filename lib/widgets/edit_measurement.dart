import 'package:flutter/material.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;

import '../widgets/image._picker.dart';
import '../screen/homeScreen..dart';

class EditMeasurement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    String _nameController;

    String _addressController;

    String _phoneNumberController;

    File _customerPics;

    String _styleNameController;

    String _styleDescriptnController;

    String _fabricTypeController;

    File _fabricImageController;

    File _styleRefController;

    int _shoulderController;

    int _chestController;

    int _bustController;

    int _bustSpanController;

    int _waistController;

    int _bandController;

    int _hipsController;

    int _shoulderNippleController;

    int _shoulderUnderbustController;

    int _halfLengthController;

    int _blouseLengthController;

    int _skirtLengthController;

    int _gownLengthController;

    int _sleeveController;

    int _armHoleController;

    int _thighCircController;

    int _kneeCircController;

    int _bandKneeController;

    int _soleCircController;

    int _bandSoleController;

    String _placeHolder1Controller;
    int _value1Controller;
    String _placeHolder2Controller;
    int _value2Controller;
    String _placeHolder3Controller;
    int _value3Controller;
    String _placeHolder4Controller;
    int _value4Controller;
    String _placeHolder5Controller;
    int _value5Controller;
    String _placeHolder6Controller;
    int _value6Controller;
    String _placeHolder7Controller;
    int _value7Controller;
    String _placeHolder8Controller;
    int _value8Controller;
    Duration _daysLeftController;
    int _priceController;
    String _paymentStatusController;
    String _interval;
    DateTime _receivedSelectedDate;
    DateTime _dueSelectedDate;

    String _calcDaysLeft(
        BuildContext context, DateTime firstDate, DateTime secondDate) {
      int _daysLeft = secondDate.difference(firstDate).inDays;
      // setState(() {
      _interval = _daysLeft.toString();
      // });
      return _interval.toString();
    }

    Future displayDateRangePicker(BuildContext context) async {
      final List<DateTime> picked = await DateRagePicker.showDatePicker(
          context: context,
          initialFirstDate: new DateTime.now(),
          initialLastDate: (new DateTime.now()).add(new Duration(days: 7)),
          firstDate: new DateTime(DateTime.now().year - 10),
          lastDate: new DateTime(DateTime.now().year + 10));
      if (picked != null && picked.length == 2) {
        // setState(() {
        _receivedSelectedDate = picked[0];
        _dueSelectedDate = picked[1];
        // });
      }
    }

    void _selectCustomerImage(File pickedImage) {
      _customerPics = pickedImage;
    }

    void _selectFabricImage(File pickedImage) {
      _fabricImageController = pickedImage;
    }

    void _selectStyleImage(File pickedImage) {
      _styleRefController = pickedImage;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Text(
          'Add Measurement',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.check), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Customer\'s name'),
                    keyboardType: TextInputType.text,
                    autovalidate: true,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Name cannot be empty!';
                      }
                      return '';
                    },
                    onSaved: (String value) {
                      _nameController = value;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Phone Number :'),
                    autovalidate: true,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'it is required ';
                      }
                    },
                    keyboardType: TextInputType.phone,
                    onSaved: (String value) {
                      _phoneNumberController = value;
                    },
                  ),
                  TextField(
                    decoration:
                        InputDecoration(labelText: 'Customer\'s Address '),
                    onChanged: (String value) {
                      // setState(() {
                      _addressController = value;
                      // });
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ImageInput(
                    'Add Customer\'s Picture',
                    _selectCustomerImage,
                    _customerPics,
                    _customerPics,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                          decoration:
                              InputDecoration(labelText: 'Style Name :'),
                          keyboardType: TextInputType.text,
                          onChanged: (String value) {
                            _styleNameController = value;
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                          decoration: InputDecoration(
                              labelText: 'Customer\'s Fabric Type'),
                          onChanged: (String value) {
                            _fabricTypeController = value;
                          },
                        ),
                      ),
                    ],
                  ),
                  TextField(
                    decoration:
                        InputDecoration(labelText: 'Style Description '),
                    onChanged: (String value) {
                      _styleDescriptnController = value;
                    },
                    maxLines: 3,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ImageInput(
                    'Add Fabric Image',
                    _selectFabricImage,
                    _fabricImageController,
                    _fabricImageController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ImageInput(
                    'Add Style Image',
                    _selectStyleImage,
                    _styleRefController,
                    _styleRefController,
                  ),
                  Divider(
                    // height: 10,
                    color: Colors.black54, thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                          decoration: InputDecoration(labelText: 'Shoulder :'),
                          keyboardType: TextInputType.number,
                          onChanged: (String value) {
                            _shoulderController = int.parse(value);
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                          decoration: InputDecoration(labelText: 'Chest :'),
                          keyboardType: TextInputType.number,
                          onChanged: (String value) {
                            _chestController = int.parse(value);
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                          decoration: InputDecoration(labelText: 'Bust :'),
                          keyboardType: TextInputType.number,
                          onChanged: (String value) {
                            _bustController = int.parse(value);
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                          decoration: InputDecoration(labelText: 'Bust Span :'),
                          keyboardType: TextInputType.number,
                          onChanged: (String value) {
                            _bustSpanController = int.parse(value);
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                          decoration: InputDecoration(labelText: 'Waist :'),
                          keyboardType: TextInputType.number,
                          onChanged: (String value) {
                            _waistController = int.parse(value);
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                          decoration: InputDecoration(labelText: 'Band :'),
                          keyboardType: TextInputType.number,
                          onChanged: (String value) {
                            _bandController = int.parse(value);
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                          decoration: InputDecoration(labelText: 'Hips :'),
                          keyboardType: TextInputType.number,
                          onChanged: (String value) {
                            _hipsController = int.parse(value);
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                          decoration:
                              InputDecoration(labelText: 'Shoulder-nipple :'),
                          keyboardType: TextInputType.number,
                          onChanged: (String value) {
                            _shoulderNippleController = int.parse(value);
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                          decoration: InputDecoration(
                              labelText: 'Shoulder-underbust :'),
                          keyboardType: TextInputType.number,
                          onChanged: (String value) {
                            _shoulderUnderbustController = int.parse(value);
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                          decoration:
                              InputDecoration(labelText: 'Half Length :'),
                          keyboardType: TextInputType.number,
                          onChanged: (String value) {
                            _halfLengthController = int.parse(value);
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                          decoration:
                              InputDecoration(labelText: 'Blouse Length :'),
                          keyboardType: TextInputType.number,
                          onChanged: (String value) {
                            _blouseLengthController = int.parse(value);
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                          decoration:
                              InputDecoration(labelText: 'Skirt Length :'),
                          keyboardType: TextInputType.number,
                          onChanged: (String value) {
                            _skirtLengthController = int.parse(value);
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                          decoration:
                              InputDecoration(labelText: 'Gown Length :'),
                          keyboardType: TextInputType.number,
                          onChanged: (String value) {
                            _gownLengthController = int.parse(value);
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                          decoration: InputDecoration(labelText: 'Sleeve :'),
                          keyboardType: TextInputType.number,
                          onChanged: (String value) {
                            _sleeveController = int.parse(value);
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                          decoration: InputDecoration(labelText: 'Arm Hole :'),
                          keyboardType: TextInputType.number,
                          onChanged: (String value) {
                            _armHoleController = int.parse(value);
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                          decoration: InputDecoration(
                              labelText: 'Thigh Circumference :'),
                          keyboardType: TextInputType.number,
                          onChanged: (String value) {
                            _thighCircController = int.parse(value);
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                          decoration: InputDecoration(
                              labelText: 'Knee Circumference :'),
                          keyboardType: TextInputType.number,
                          onChanged: (String value) {
                            _kneeCircController = int.parse(value);
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                          decoration: InputDecoration(labelText: 'Band-knee :'),
                          keyboardType: TextInputType.number,
                          onChanged: (String value) {
                            _bandKneeController = int.parse(value);
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                          decoration: InputDecoration(
                              labelText: 'Sole Circumference :'),
                          keyboardType: TextInputType.number,
                          onChanged: (String value) {
                            _soleCircController = int.parse(value);
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                          decoration: InputDecoration(labelText: 'Band-sole :'),
                          keyboardType: TextInputType.number,
                          onChanged: (String value) {
                            _bandSoleController = int.parse(value);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        'Have additional measurements? Add them below !',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 2,
                    color: Theme.of(context).primaryColor,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                          decoration:
                              InputDecoration(labelText: 'Place holder 1 :'),
                          keyboardType: TextInputType.text,
                          onChanged: (String value) {
                            _placeHolder1Controller = value;
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                          decoration: InputDecoration(labelText: 'Value 1 :'),
                          keyboardType: TextInputType.number,
                          onChanged: (String value) {
                            _value1Controller = int.parse(value);
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                          decoration:
                              InputDecoration(labelText: 'Place holder 2 :'),
                          keyboardType: TextInputType.text,
                          onChanged: (String value) {
                            _placeHolder2Controller = value;
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                          decoration: InputDecoration(labelText: 'Value 2 :'),
                          keyboardType: TextInputType.number,
                          onChanged: (String value) {
                            _value2Controller = int.parse(value);
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                          decoration:
                              InputDecoration(labelText: 'Place holder 3 :'),
                          keyboardType: TextInputType.text,
                          onChanged: (String value) {
                            _placeHolder3Controller = value;
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                          decoration: InputDecoration(labelText: 'Value 3 :'),
                          keyboardType: TextInputType.number,
                          onChanged: (String value) {
                            _value3Controller = int.parse(value);
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                          decoration:
                              InputDecoration(labelText: 'Place holder 4 :'),
                          keyboardType: TextInputType.text,
                          onChanged: (String value) {
                            _placeHolder4Controller = value;
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                          decoration: InputDecoration(labelText: 'Value 4 :'),
                          keyboardType: TextInputType.number,
                          onChanged: (String value) {
                            _value4Controller = int.parse(value);
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                          decoration:
                              InputDecoration(labelText: 'Place holder 5 :'),
                          keyboardType: TextInputType.text,
                          onChanged: (String value) {
                            _placeHolder5Controller = value;
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                          decoration: InputDecoration(labelText: 'Value 5 :'),
                          keyboardType: TextInputType.number,
                          onChanged: (String value) {
                            _value5Controller = int.parse(value);
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                          decoration:
                              InputDecoration(labelText: 'Place holder 6 :'),
                          keyboardType: TextInputType.text,
                          onChanged: (String value) {
                            _placeHolder6Controller = value;
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                          decoration: InputDecoration(labelText: 'Value 6 :'),
                          keyboardType: TextInputType.number,
                          onChanged: (String value) {
                            _value6Controller = int.parse(value);
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                          decoration:
                              InputDecoration(labelText: 'Place holder 7 :'),
                          keyboardType: TextInputType.text,
                          onChanged: (String value) {
                            _placeHolder7Controller = value;
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                          decoration: InputDecoration(labelText: 'Value 7 :'),
                          keyboardType: TextInputType.number,
                          onChanged: (String value) {
                            _value7Controller = int.parse(value);
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                          decoration:
                              InputDecoration(labelText: 'Place holder 8 :'),
                          keyboardType: TextInputType.text,
                          onChanged: (String value) {
                            _placeHolder8Controller = value;
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                          decoration: InputDecoration(labelText: 'Value 8 :'),
                          keyboardType: TextInputType.number,
                          onChanged: (String value) {
                            _value8Controller = int.parse(value);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Column(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () async {
                                  await displayDateRangePicker(context);
                                },
                                child: Container(
                                  height: 50.0,
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  child: Material(
                                    borderRadius: BorderRadius.circular(40),
                                    // shadowColor: Colors.brown,
                                    color: Colors.black38,
                                    // elevation: 7.0,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          Icons.date_range,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          'Choose Job Received and Due date: ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Recived Date'
                                //   DateFormat.yMMMEd()
                                //       .format(_receivedSelectedDate),
                                ),
                            Text(
                              _dueSelectedDate == null &&
                                      _receivedSelectedDate == null
                                  ? 'nill'
                                  : _calcDaysLeft(
                                      context,
                                      _receivedSelectedDate,
                                      _dueSelectedDate,
                                    ),
                            ),
                            Text('Due Date'
                                //   DateFormat.yMMMEd()
                                //       .format(_dueSelectedDate),
                                ),
                          ],
                        )
                      ],
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount :'),
                    keyboardType: TextInputType.number,
                    onChanged: (String value) {
                      _priceController = int.parse(value);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: null,
                    child: Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.black38,
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.brown,
                        //     offset: Offset(0.0, 0.5),
                        //     blurRadius: 30.0,
                        //   ),
                        // ],
                        // gradient: LinearGradient(
                        //   colors: [
                        //     Colors.orange,
                        //     Colors.brown,
                        //     Colors.orange,
                        //   ],
                        //   begin: Alignment.topLeft,
                        //   end: Alignment.bottomRight,
                        // ),
                      ),
                      child: Center(
                          child: Text(
                        'SAVE',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            fontFamily: 'OpenSans'),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
