import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import '../helper/dbHelper.dart';
import 'dart:async';
import './image._picker.dart';
import '../model/model.dart';
import '../screen/homeScreen..dart';

class NewJob extends StatefulWidget {
  @override
  _NewJobState createState() => _NewJobState();
}

class _NewJobState extends State<NewJob> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final DbJobManager dbJobManager = new DbJobManager();
  Job job;
  String _nameController;

  String _addressController;

  String _phoneNumberController;

  File _customerPics;

  String _styleNameController;

  String _styleDescriptnController;

  String _fabricTypeController;

  File _fabricImageController;

  File _styleRefController;

  String _shoulderController;

  String _chestController;

  String _bustController;

  String _bustSpanController;

  String _waistController;

  String _bandController;

  String _hipsController;

  String _shoulderNippleController;

  String _shoulderUnderbustController;

  String _halfLengthController;

  String _blouseLengthController;

  String _skirtLengthController;

  String _gownLengthController;

  String _sleeveController;

  String _armHoleController;

  String _thighCircController;

  String _kneeCircController;

  String _bandKneeController;

  String _soleCircController;

  String _bandSoleController;

  String _placeHolder1Controller;
  String _value1Controller;
  String _placeHolder2Controller;
  String _value2Controller;
  String _placeHolder3Controller;
  String _value3Controller;
  String _placeHolder4Controller;
  String _value4Controller;
  String _placeHolder5Controller;
  String _value5Controller;
  String _placeHolder6Controller;
  String _value6Controller;
  String _placeHolder7Controller;
  String _value7Controller;
  String _placeHolder8Controller;
  String _value8Controller;
  Duration _daysLeftController;
  String _priceController;
  String _paymentStatusController;
  String _interval;
  DateTime _receivedSelectedDate = DateTime.now();
  DateTime _dueSelectedDate = DateTime.now().add(new Duration(days: 3));

  void _submitData() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    String id = DateTime.now().toString();
    String enteredName = _nameController;
    String enteredAddress = _addressController;
    String enteredPhoneNumber = _phoneNumberController;
    String enteredStyleName = _styleNameController;
    String enteredStyleDecription = _styleDescriptnController;
    String enteredFabricType = _fabricTypeController;
    File enteredFabricImage = _fabricImageController;
    File enteredStyleRef = _styleRefController;
    String enteredShoulder = _shoulderController;
    String enteredChest = _chestController;
    String enteredBust = _bustController;
    String enteredBustSpan = _bustSpanController;
    String enteredWaist = _waistController;
    String enteredBand = _bandController;
    String enteredHips = _hipsController;
    String enteredShoulderNipple = _shoulderNippleController;
    String enteredShoulderUnderBust = _shoulderUnderbustController;
    String enteredHalfLength = _halfLengthController;
    String enteredBlouselength = _blouseLengthController;
    String enteredSkirtLength = _skirtLengthController;
    String enteredGownLength = _gownLengthController;
    String enteredSleeve = _sleeveController;
    String enteredArmHole = _armHoleController;
    String enteredThighCirc = _thighCircController;
    String enteredKneeCirc = _kneeCircController;
    String enteredBandKnee = _bandKneeController;
    String enteredSoleCirc = _soleCircController;
    String enteredBandSole = _bandSoleController;
    File enteredCustomerPics = _customerPics;
    String enteredPlaceHolder1 = _placeHolder1Controller;
    String enteredValue1 = _value1Controller;
    String enteredPlaceHolder2 = _placeHolder2Controller;
    String enteredValue2 = _value2Controller;
    String enteredPlaceHolder3 = _placeHolder3Controller;
    String enteredValue3 = _value3Controller;
    String enteredPlaceHolder4 = _placeHolder4Controller;
    String enteredValue4 = _value4Controller;
    String enteredPlaceHolder5 = _placeHolder5Controller;
    String enteredValue5 = _value5Controller;
    String enteredPlaceHolder6 = _placeHolder6Controller;
    String enteredValue6 = _value6Controller;
    String enteredPlaceHolder7 = _placeHolder7Controller;
    String enteredValue7 = _value7Controller;
    String enteredPlaceHolder8 = _placeHolder8Controller;
    String enteredValue8 = _value8Controller;

    if (job == null) {
      Job job = new Job(
        id: id,
        name: enteredName,
        address: enteredAddress,
        phoneNumber: enteredPhoneNumber,
        styleName: enteredStyleName,
        styleDescriptn: enteredStyleDecription,
        styleRefPics: enteredStyleRef.path,
        customerPics: enteredCustomerPics.path,
        fabricPics: enteredFabricImage.path,
        recievedDate: _receivedSelectedDate.toString(),
        dueDate: _dueSelectedDate.toString(),
        // price: _priceController,
        fabricType: enteredFabricType,
        shoulder: enteredShoulder,
        chest: enteredChest,
        bust: enteredBust,
        bustSpan: enteredBustSpan,
        waist: enteredWaist,
        band: enteredBand,
        hips: enteredHips,
        shoulderNipple: enteredShoulderNipple,
        shoulderUnderburst: enteredShoulderUnderBust,
        halfLength: enteredHalfLength,
        blouseLength: enteredBlouselength,
        skirtLength: enteredSkirtLength,
        gownLength: enteredGownLength,
        sleeve: enteredSleeve,
        armHole: enteredArmHole,
        thighCirc: enteredThighCirc,
        kneeCirc: enteredKneeCirc,
        bandKnee: enteredBandKnee,
        soleCirc: enteredSoleCirc,
        bandSole: enteredBandSole,
        placeHolder1: enteredPlaceHolder1,
        placeHolder2: enteredPlaceHolder2,
        placeHolder3: enteredPlaceHolder3,
        placeHolder4: enteredPlaceHolder4,
        placeHolder5: enteredPlaceHolder5,
        placeHolder6: enteredPlaceHolder6,
        placeHolder7: enteredPlaceHolder7,
        placeHolder8: enteredPlaceHolder8,
        value1: enteredValue1,
        value2: enteredValue2,
        value3: enteredValue3,
        value4: enteredValue4,
        value5: enteredValue5,
        value6: enteredValue6,
        value7: enteredValue7,
        value8: enteredValue8,
      );
      dbJobManager.insertJob(job).then((id) {
        print('New Job Added to Database $id');
        print('New Job Added to PhoneNumber ${job.phoneNumber}');
        print('New Job Added to Description ${job.styleDescriptn}');
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'New job added!',
              textAlign: TextAlign.center,
            ),
            duration: Duration(seconds: 4),
          ),
        );
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen(),
          ),
        );
      });
    }
  }

  Future displayDateRangePicker(BuildContext context) async {
    final List<DateTime> picked = await DateRagePicker.showDatePicker(
        context: context,
        initialFirstDate: new DateTime.now(),
        initialLastDate: (new DateTime.now()).add(new Duration(days: 7)),
        firstDate: new DateTime(DateTime.now().year - 10),
        lastDate: new DateTime(DateTime.now().year + 10));
    if (picked != null && picked.length == 2) {
      setState(() {
        _receivedSelectedDate = picked[0];
        _dueSelectedDate = picked[1];
      });
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

  String _calcDaysLeft(
      BuildContext context, DateTime firstDate, DateTime secondDate) {
    int _daysLeft = secondDate.difference(firstDate).inDays;
    setState(() {
      _interval = _daysLeft.toString();
    });
    return _interval.toString();
  }

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width * 0.4;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Job',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            )),
        actions: <Widget>[
          InkWell(
              onTap: _submitData,
              child: Center(
                child: Text('Save',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
              )),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.1,
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        dragStartBehavior: DragStartBehavior.start,
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.transparent,
              width: double.infinity,
              child: Text(
                'Enter Customer\'s Information to Add a New Job.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Form(
                key: _formKey,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.89,
                  child: ListView(children: <Widget>[
                    Card(
                      elevation: 5,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  width: mediaWidth,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        labelText: 'Customer\'s Name :'),
                                    keyboardType: TextInputType.text,
                                    autovalidate: true,
                                    validator: (String value) {
                                      if (value.isEmpty) {
                                        return 'it is required ';
                                      }
                                    },
                                    onSaved: (String value) {
                                      _nameController = value;
                                    },
                                  ),
                                ),
                                Container(
                                  width: mediaWidth,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        labelText: 'Phone Number :'),
                                    autovalidate: true,
                                    validator: (String value) {
                                      if (value.isEmpty && value.length != 11) {
                                        return 'Enter only 11 digits, it is required ';
                                      }
                                    },
                                    keyboardType: TextInputType.phone,
                                    onSaved: (String value) {
                                      _phoneNumberController = value;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  labelText: 'Customer\'s Address '),
                              onChanged: (String value) {
                                setState(() {
                                  _addressController = value;
                                });
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            // TextField(
                            //   decoration:
                            //       InputDecoration(labelText: 'Customer\'s Picture '),
                            //   onSaved: (String value) {
                            //     setState(() {
                            //       _customerPics = value;
                            //     });
                            //   },
                            // ),

                            ImageInput(
                              'Add Customer\'s Picture',
                              _selectCustomerImage,
                              _customerPics,
                              _customerPics,
                            ),
                            // _buildStringFormField('Style name', _styletextController),

                            TextField(
                              decoration: InputDecoration(
                                  labelText: 'Style Description '),
                              onChanged: (String value) {
                                _styleDescriptnController = value;
                              },
                              maxLines: 3,
                            ),
                            // _buildStringFormField(
                            //     'Customer\'s Fabric Type', _fabricTypeController),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  width: mediaWidth,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        labelText: 'Style Name :'),
                                    keyboardType: TextInputType.text,
                                    onChanged: (String value) {
                                      _styleNameController = value;
                                    },
                                  ),
                                ),
                                Container(
                                  width: mediaWidth,
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
                                  width: mediaWidth,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        labelText: 'Shoulder :'),
                                    keyboardType: TextInputType.number,
                                    onChanged: (String value) {
                                      _shoulderController = value;
                                    },
                                  ),
                                ),
                                Container(
                                  width: mediaWidth,
                                  child: TextField(
                                    decoration:
                                        InputDecoration(labelText: 'Chest :'),
                                    keyboardType: TextInputType.number,
                                    onChanged: (String value) {
                                      _chestController = value;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  width: mediaWidth,
                                  child: TextField(
                                    decoration:
                                        InputDecoration(labelText: 'Bust :'),
                                    keyboardType: TextInputType.number,
                                    onChanged: (String value) {
                                      _bustController = value;
                                    },
                                  ),
                                ),
                                Container(
                                  width: mediaWidth,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        labelText: 'Bust Span :'),
                                    keyboardType: TextInputType.number,
                                    onChanged: (String value) {
                                      _bustSpanController = value;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  width: mediaWidth,
                                  child: TextField(
                                    decoration:
                                        InputDecoration(labelText: 'Waist :'),
                                    keyboardType: TextInputType.number,
                                    onChanged: (String value) {
                                      _waistController = value;
                                    },
                                  ),
                                ),
                                Container(
                                  width: mediaWidth,
                                  child: TextField(
                                    decoration:
                                        InputDecoration(labelText: 'Band :'),
                                    keyboardType: TextInputType.number,
                                    onChanged: (String value) {
                                      _bandController = value;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  width: mediaWidth,
                                  child: TextField(
                                    decoration:
                                        InputDecoration(labelText: 'Hips :'),
                                    keyboardType: TextInputType.number,
                                    onChanged: (String value) {
                                      _hipsController = value;
                                    },
                                  ),
                                ),
                                Container(
                                  width: mediaWidth,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        labelText: 'Shoulder-nipple :'),
                                    keyboardType: TextInputType.number,
                                    onChanged: (String value) {
                                      _shoulderNippleController = value;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  width: mediaWidth,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        labelText: 'Shoulder-underbust :'),
                                    keyboardType: TextInputType.number,
                                    onChanged: (String value) {
                                      _shoulderUnderbustController = value;
                                    },
                                  ),
                                ),
                                Container(
                                  width: mediaWidth,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        labelText: 'Half Length :'),
                                    keyboardType: TextInputType.number,
                                    onChanged: (String value) {
                                      _halfLengthController = value;
                                    },
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  width: mediaWidth,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        labelText: 'Blouse Length :'),
                                    keyboardType: TextInputType.number,
                                    onChanged: (String value) {
                                      _blouseLengthController = value;
                                    },
                                  ),
                                ),
                                Container(
                                  width: mediaWidth,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        labelText: 'Skirt Length :'),
                                    keyboardType: TextInputType.number,
                                    onChanged: (String value) {
                                      _skirtLengthController = value;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  width: mediaWidth,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        labelText: 'Gown Length :'),
                                    keyboardType: TextInputType.number,
                                    onChanged: (String value) {
                                      _gownLengthController = value;
                                    },
                                  ),
                                ),
                                Container(
                                  width: mediaWidth,
                                  child: TextField(
                                    decoration:
                                        InputDecoration(labelText: 'Sleeve :'),
                                    keyboardType: TextInputType.number,
                                    onChanged: (String value) {
                                      _sleeveController = value;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  width: mediaWidth,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        labelText: 'Arm Hole :'),
                                    keyboardType: TextInputType.number,
                                    onChanged: (String value) {
                                      _armHoleController = value;
                                    },
                                  ),
                                ),
                                Container(
                                  width: mediaWidth,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        labelText: 'Thigh Circumference :'),
                                    keyboardType: TextInputType.number,
                                    onChanged: (String value) {
                                      _thighCircController = value;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  width: mediaWidth,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        labelText: 'Knee Circumference :'),
                                    keyboardType: TextInputType.number,
                                    onChanged: (String value) {
                                      _kneeCircController = value;
                                    },
                                  ),
                                ),
                                Container(
                                  width: mediaWidth,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        labelText: 'Band-knee :'),
                                    keyboardType: TextInputType.number,
                                    onChanged: (String value) {
                                      _bandKneeController = value;
                                    },
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  width: mediaWidth,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        labelText: 'Sole Circumference :'),
                                    keyboardType: TextInputType.number,
                                    onChanged: (String value) {
                                      _soleCircController = value;
                                    },
                                  ),
                                ),
                                Container(
                                  width: mediaWidth,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        labelText: 'Band-sole :'),
                                    keyboardType: TextInputType.number,
                                    onChanged: (String value) {
                                      _bandSoleController = value;
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
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        labelText: 'Place holder 1 :'),
                                    keyboardType: TextInputType.text,
                                    onChanged: (String value) {
                                      _placeHolder1Controller = value;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: TextField(
                                    decoration:
                                        InputDecoration(labelText: 'Value 1 :'),
                                    keyboardType: TextInputType.number,
                                    onChanged: (String value) {
                                      _value1Controller = value;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        labelText: 'Place holder 2 :'),
                                    keyboardType: TextInputType.text,
                                    onChanged: (String value) {
                                      _placeHolder2Controller = value;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: TextField(
                                    decoration:
                                        InputDecoration(labelText: 'Value 2 :'),
                                    keyboardType: TextInputType.number,
                                    onChanged: (String value) {
                                      _value2Controller = value;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        labelText: 'Place holder 3 :'),
                                    keyboardType: TextInputType.text,
                                    onChanged: (String value) {
                                      _placeHolder3Controller = value;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: TextField(
                                    decoration:
                                        InputDecoration(labelText: 'Value 3 :'),
                                    keyboardType: TextInputType.number,
                                    onChanged: (String value) {
                                      _value3Controller = value;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        labelText: 'Place holder 4 :'),
                                    keyboardType: TextInputType.text,
                                    onChanged: (String value) {
                                      _placeHolder4Controller = value;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: TextField(
                                    decoration:
                                        InputDecoration(labelText: 'Value 4 :'),
                                    keyboardType: TextInputType.number,
                                    onChanged: (String value) {
                                      _value4Controller = value;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        labelText: 'Place holder 5 :'),
                                    keyboardType: TextInputType.text,
                                    onChanged: (String value) {
                                      _placeHolder5Controller = value;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: TextField(
                                    decoration:
                                        InputDecoration(labelText: 'Value 5 :'),
                                    keyboardType: TextInputType.number,
                                    onChanged: (String value) {
                                      _value5Controller = value;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        labelText: 'Place holder 6 :'),
                                    keyboardType: TextInputType.text,
                                    onChanged: (String value) {
                                      _placeHolder6Controller = value;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: TextField(
                                    decoration:
                                        InputDecoration(labelText: 'Value 6 :'),
                                    keyboardType: TextInputType.number,
                                    onChanged: (String value) {
                                      _value6Controller = value;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        labelText: 'Place holder 7 :'),
                                    keyboardType: TextInputType.text,
                                    onChanged: (String value) {
                                      _placeHolder7Controller = value;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: TextField(
                                    decoration:
                                        InputDecoration(labelText: 'Value 7 :'),
                                    keyboardType: TextInputType.number,
                                    onChanged: (String value) {
                                      _value7Controller = value;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        labelText: 'Place holder 8 :'),
                                    keyboardType: TextInputType.text,
                                    onChanged: (String value) {
                                      _placeHolder8Controller = value;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: TextField(
                                    decoration:
                                        InputDecoration(labelText: 'Value 8 :'),
                                    keyboardType: TextInputType.number,
                                    onChanged: (String value) {
                                      _value8Controller = value;
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
                                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        GestureDetector(
                                          onTap: () async {
                                            await displayDateRangePicker(
                                                context);
                                          },
                                          child: Container(
                                            height: 50.0,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.8,
                                            child: Material(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                              shadowColor: Colors.brown,
                                              color: Colors.black38,
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
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            // onPressed: () async {
                                            //   await displayDateRangePicker(context);
                                            // },
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Divider(
                                          thickness: 2,
                                          color: Colors.black,
                                          indent: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05,
                                          endIndent: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05,
                                        ),
                                        Container(
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                'Job Received Date: ',
                                                style: TextStyle(
                                                  fontFamily: 'RObotoCondensed',
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Icon(
                                                Icons.calendar_today,
                                                color: Colors.green,
                                                size: 16,
                                              ),
                                              Text(
                                                DateFormat.yMMMEd().format(
                                                    _receivedSelectedDate),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                'Job Due Date: ',
                                                style: TextStyle(
                                                  fontFamily: 'RobotoCondensed',
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Icon(
                                                Icons.calendar_today,
                                                color: Colors.red,
                                                size: 16,
                                              ),
                                              Text(
                                                DateFormat.yMMMEd()
                                                    .format(_dueSelectedDate),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text('Interval of Days: ',
                                              style: TextStyle(
                                                  fontFamily: 'RobotoCondensed',
                                                  color: Colors.black)),
                                          Icon(
                                            Icons.timelapse,
                                            size: 16,
                                          ),
                                          Text(
                                            _dueSelectedDate == null &&
                                                    _receivedSelectedDate ==
                                                        null
                                                ? 'nill'
                                                : _calcDaysLeft(
                                                    context,
                                                    _receivedSelectedDate,
                                                    _dueSelectedDate,
                                                  ),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'RobotoCondensed',
                                            ),
                                          ),
                                          Text('   Days',
                                              style: TextStyle(
                                                fontFamily: 'RobotoCondensed',
                                                color: Colors.black,
                                              ))
                                          // SizedBox(
                                          //   width: 10,
                                          // ),
                                          // Flexible(
                                          //   flex: 1,
                                          //   child: Container(
                                          //     alignment: Alignment.center,
                                          //     width: 100,
                                          //     height: 35,
                                          //     color: Theme.of(context).primaryColor,
                                          //     child: Row(
                                          //       children: <Widget>[
                                          //         Icon(
                                          //           Icons.hourglass_full,
                                          //           color: Colors.white,
                                          //         ),
                                          //         SizedBox(
                                          //           width: 10,
                                          //         ),
                                          //         Text(
                                          //             (DateTime.now()
                                          //                 .difference(_dueSelectedDate)
                                          //                 .inHours
                                          //                 .toString()),
                                          //             style: TextStyle(
                                          //                 color: Colors.white,
                                          //                 fontSize: 22,
                                          //                 fontWeight: FontWeight.bold)),
                                          //       ],
                                          //     ),
                                          //   ),
                                          // ),
                                        ]),
                                  ),
                                ],
                              ),
                            ),

                            // TextField(
                            //   decoration: InputDecoration(labelText: 'Price :'),
                            //   keyboardType: TextInputType.number,
                            //   onChanged: (String value) {
                            //     _priceController = value;
                            //   },
                            // ),
                            // TextField(
                            //   decoration: InputDecoration(
                            //       labelText: 'Payment Status :'),
                            //   onChanged: (String value) {
                            //     _paymentStatusController = value;
                            //   },
                            // ),

                            Divider(
                              thickness: 2,
                              color: Colors.black,
                              indent: MediaQuery.of(context).size.width * 0.05,
                              endIndent:
                                  MediaQuery.of(context).size.width * 0.05,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: _submitData,
                              child: Container(
                                height: 50.0,
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.brown,
                                      offset: Offset(0.0, 0.5),
                                      blurRadius: 30.0,
                                    ),
                                  ],
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

                            SizedBox(
                              height: 100,
                            )
                            // Container(
                            //   width: MediaQuery.of(context).size.width * 0.6,
                            //   child: RaisedButton(
                            //     padding: EdgeInsets.all(4),
                            //     color: accentColor,
                            //     child: Row(
                            //       mainAxisAlignment: MainAxisAlignment.center,
                            //       children: [
                            //         Icon(Icons.save, color: Colors.white),
                            //         Text(
                            //           'Add to Jobs',
                            //           style: TextStyle(fontWeight: FontWeight.bold),
                            //         ),
                            //       ],
                            //     ),
                            //     onPressed: _submitData,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    //         ),
    //     ),],
    //   ),);
    // }
  }
}
