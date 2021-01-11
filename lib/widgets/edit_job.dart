import 'package:flutter/material.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;

import '../widgets/image._picker.dart';
import '../helper/dbHelper.dart';
import '../model/model.dart';
import '../screen/homeScreen..dart';
import './date_display.dart';

class EditJob extends StatelessWidget {
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

  EditJob({
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
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final DbJobManager dbJobManager = new DbJobManager();
    Job job;
    final _nameController = TextEditingController();
    final _addressController = TextEditingController();
    final _phoneNumberController = TextEditingController();
    File _customerPics;
    final _styleNameController = TextEditingController();
    final _styleDescriptnController = TextEditingController();
    final _fabricTypeController = TextEditingController();
    File _fabricImageController;
    File _styleRefController;
    final _shoulderController = TextEditingController();
    final _chestController = TextEditingController();
    final _bustController = TextEditingController();
    final _bustSpanController = TextEditingController();
    final _waistController = TextEditingController();
    final _bandController = TextEditingController();
    final _hipsController = TextEditingController();
    final _shoulderNippleController = TextEditingController();
    final _shoulderUnderbustController = TextEditingController();
    final _halfLengthController = TextEditingController();
    final _blouseLengthController = TextEditingController();
    final _skirtLengthController = TextEditingController();
    final _gownLengthController = TextEditingController();
    final _sleeveController = TextEditingController();
    final _armHoleController = TextEditingController();
    final _thighCircController = TextEditingController();
    final _kneeCircController = TextEditingController();
    final _bandKneeController = TextEditingController();
    final _soleCircController = TextEditingController();
    final _bandSoleController = TextEditingController();
    final _placeHolder1Controller = TextEditingController();
    final _value1Controller = TextEditingController();
    final _placeHolder2Controller = TextEditingController();
    final _value2Controller = TextEditingController();
    final _placeHolder3Controller = TextEditingController();
    final _value3Controller = TextEditingController();
    final _placeHolder4Controller = TextEditingController();
    final _value4Controller = TextEditingController();
    final _placeHolder5Controller = TextEditingController();
    final _value5Controller = TextEditingController();
    final _placeHolder6Controller = TextEditingController();
    final _value6Controller = TextEditingController();
    final _placeHolder7Controller = TextEditingController();
    final _value7Controller = TextEditingController();
    final _placeHolder8Controller = TextEditingController();
    final _value8Controller = TextEditingController();
    // String _daysLeftController;
    final _priceController = TextEditingController();
    // final _paymentStatusController = TextEditingController();
    // String _interval;
    DateTime _receivedSelectedDate = DateTime.now();
    DateTime _dueSelectedDate = DateTime.now().add(Duration(days: 3));
    int _interval;
    // String _calcDaysLeft(
    //     BuildContext context, DateTime firstDate, DateTime secondDate) {
    //   int _daysLeft = secondDate.difference(firstDate).inDays;
    //   // setState(() {
    //   _interval = _daysLeft.toString();
    //   // });
    //   return _interval.toString();
    // }

    Future displayDateRangePicker(BuildContext context) async {
      final List<DateTime> picked = await DateRagePicker.showDatePicker(
          context: context,
          initialFirstDate: _receivedSelectedDate,
          initialLastDate: _dueSelectedDate,
          firstDate: new DateTime(DateTime.now().year - 20),
          lastDate: new DateTime(DateTime.now().year + 20));
      if (picked != null && picked.length == 2) {
        // setState(() {
          _receivedSelectedDate = picked[0];
          _dueSelectedDate = picked[1];
        // });
      }
    }

    String _calcDaysLeft(
        BuildContext context, DateTime firstDate, DateTime secondDate) {
      int _daysLeft = secondDate.difference(firstDate).inDays;
      // setState(() {
        _interval = _daysLeft;
      // });
      // setState(() {});
      return _interval.toString();
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

    void _submitNewJob(BuildContext context) {
      if (_formKey.currentState.validate()) {
        if (job == null) {
          Job job = new Job(
              name: _nameController.text,
              address: _addressController.text,
              phoneNumber: _phoneNumberController.text,
              styleName: _styleNameController.text,
              styleDescriptn: _styleDescriptnController.text,
              styleRefPics: _styleRefController.toString(),
              customerPics: _customerPics.toString(),
              fabricPics: _fabricImageController.toString(),
              recievedDate: _receivedSelectedDate.toString(),
              dueDate: _dueSelectedDate.toString(),
              // price: _priceController.text,
              fabricType: _fabricTypeController.text,
              shoulder: _shoulderController.text,
              chest: _chestController.text,
              bust: _bustController.text,
              bustSpan: _bustSpanController.text,
              waist: _waistController.text,
              band: _bandController.text,
              hips: _hipsController.text,
              shoulderNipple: _shoulderNippleController.text,
              shoulderUnderburst: _shoulderUnderbustController.text,
              halfLength: _halfLengthController.text,
              blouseLength: _blouseLengthController.text,
              skirtLength: _skirtLengthController.text,
              gownLength: _gownLengthController.text,
              sleeve: _sleeveController.text,
              armHole: _armHoleController.text,
              thighCirc: _thighCircController.text,
              kneeCirc: _kneeCircController.text,
              bandKnee: _bandKneeController.text,
              soleCirc: _soleCircController.text,
              bandSole: _bandSoleController.text,
              placeHolder1: _placeHolder1Controller.text,
              placeHolder2: _placeHolder2Controller.text,
              placeHolder3: _placeHolder3Controller.text,
              placeHolder4: _placeHolder4Controller.text,
              placeHolder5: _placeHolder5Controller.text,
              placeHolder6: _placeHolder6Controller.text,
              placeHolder7: _placeHolder7Controller.text,
              placeHolder8: _placeHolder8Controller.text,
              value1: _value1Controller.text,
              value2: _value2Controller.text,
              value3: _value3Controller.text,
              value4: _value4Controller.text,
              value5: _value5Controller.text,
              value6: _value6Controller.text,
              value7: _value7Controller.text,
              value8: _value8Controller.text);
          dbJobManager.insertJob(job).then(
                (id) => {
                  _nameController.clear(),
                  _addressController.clear(),
                  _phoneNumberController.clear(),
                  _customerPics,
                  _fabricImageController,
                  _styleRefController,
                  _styleNameController.clear(),
                  _styleDescriptnController.clear(),
                  _fabricTypeController.clear(),
                  _shoulderController.clear(),
                  _chestController.clear(),
                  _bustController.clear(),
                  _bustSpanController.clear(),
                  _waistController.clear(),
                  _bandController.clear(),
                  _hipsController.clear(),
                  _shoulderNippleController.clear(),
                  _shoulderUnderbustController.clear(),
                  _halfLengthController.clear(),
                  _blouseLengthController.clear(),
                  _skirtLengthController.clear(),
                  _gownLengthController.clear(),
                  _sleeveController.clear(),
                  _armHoleController.clear(),
                  _thighCircController.clear(),
                  _kneeCircController.clear(),
                  _bandKneeController.clear(),
                  _soleCircController.clear(),
                  _bandSoleController.clear(),
                  _placeHolder1Controller.clear(),
                  _value1Controller.clear(),
                  _placeHolder2Controller.clear(),
                  _value2Controller.clear(),
                  _placeHolder3Controller.clear(),
                  _value3Controller.clear(),
                  _placeHolder4Controller.clear(),
                  _value4Controller.clear(),
                  _placeHolder5Controller.clear(),
                  _value5Controller.clear(),
                  _placeHolder6Controller.clear(),
                  _value6Controller.clear(),
                  _placeHolder7Controller.clear(),
                  _value7Controller.clear(),
                  _placeHolder8Controller.clear(),
                  _value8Controller.clear(),
                  print('New Job added to Database ${id}'),
                  Navigator.of(context).pop(),
                },
              );
        }
      }
    }

    // void _selectCustomerImage(File pickedImage) {
    //   _customerPics = pickedImage;
    // }

    // void _selectFabricImage(File pickedImage) {
    //   _fabricImageController = pickedImage;
    // }

    // void _selectStyleImage(File pickedImage) {
    //   _styleImageController = pickedImage;
    // }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Edit Job',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: IconButton(
              icon: Icon(Icons.check, color: Colors.black),
              onPressed: () => _submitNewJob(context),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                          decoration:
                              InputDecoration(labelText: 'Customer\'s name'),
                          keyboardType: TextInputType.text,
                          autovalidate: true,
                          // controller: _nameController,
                          initialValue:
                              name == null ? 'nill' : name,
                          onSaved: (String value) => _nameController,
                          validator: (val) =>
                              val.isNotEmpty ? null : 'Name can not be empty!'),
                      TextFormField(
                        decoration:
                            InputDecoration(labelText: 'Phone Number :'),
                        autovalidate: true,
                        validator: (val) => val.isNotEmpty
                            ? null
                            : 'Phone number must be provided!',
                        keyboardType: TextInputType.phone,
                        // controller: _phoneNumberController,
                        initialValue: phoneNumber,
                        onSaved: (String value) => _phoneNumberController,
                      ),
                      TextFormField(
                        decoration:
                            InputDecoration(labelText: 'Customer\'s Address'),
                        autovalidate: false,
                        keyboardType: TextInputType.text,
                        // controller: _addressController,
                        initialValue: address,
                        onSaved: (String value) => _addressController,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ImageInput(
                        'Add Customer\'s Picture',
                        _selectCustomerImage,
                        File(customerPics),
                        _customerPics,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'Style Name'),
                              autovalidate: false,
                              keyboardType: TextInputType.text,
                              // controller: _styleNameController,
                              initialValue: styleName,
                              onSaved: (String value) => _styleNameController,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'Fabric Type'),
                              autovalidate: false,
                              keyboardType: TextInputType.text,
                              // controller: _fabricTypeController,
                              initialValue: fabricTYpe,
                              onSaved: (String value) => _fabricTypeController,
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        decoration:
                            InputDecoration(labelText: 'Style Description'),
                        autovalidate: false,
                        keyboardType: TextInputType.text,
                        // controller: _styleDescriptnController,
                        initialValue: styleDescription,
                        onSaved: (String value) => _styleDescriptnController,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ImageInput(
                        'Add Fabric Image',
                        _selectFabricImage,
                        File(fabricPics),
                        _fabricImageController,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ImageInput(
                        'Add Style Image',
                        _selectStyleImage,
                        File(styleRefPics),
                        _styleRefController,
                      ),
                      Divider(
                        height: 10,
                        color: Colors.black54,
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'Shoulder'),
                              autovalidate: false,
                              keyboardType: TextInputType.number,
                              // controller: _shoulderController,
                              initialValue: shoulder,
                              onSaved: (String value) => _shoulderController,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Chest'),
                              autovalidate: false,
                              keyboardType: TextInputType.number,
                              initialValue: chest,
                              // controller: _chestController,
                              onSaved: (String value) => _chestController,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Bust'),
                              autovalidate: false,
                              keyboardType: TextInputType.number,
                              // controller: _bustController,
                              initialValue: bust,
                              onSaved: (String value) => _bustController,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'Bust Span'),
                              autovalidate: false,
                              keyboardType: TextInputType.number,
                              initialValue: bustSpan,
                              // controller: _bustSpanController,
                              onSaved: (String value) => _bustSpanController,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Waist'),
                              autovalidate: false,
                              keyboardType: TextInputType.number,
                              initialValue: waist,
                              // controller: _waistController,
                              onSaved: (String value) => _waistController,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Band'),
                              autovalidate: false,
                              keyboardType: TextInputType.number,
                              initialValue: band,
                              // controller: _bandController,
                              onSaved: (String value) => _bandController,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Hips'),
                              autovalidate: false,
                              keyboardType: TextInputType.number,
                              initialValue: hips,
                              // controller: _hipsController,
                              onSaved: (String value) => _hipsController,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'Shoulder Nipple'),
                              autovalidate: false,
                              keyboardType: TextInputType.number,
                              initialValue: shoulderNipple,
                              // controller: _shoulderNippleController,
                              onSaved: (String value) =>
                                  _shoulderNippleController,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  labelText: 'Shoulder Underburst'),
                              initialValue: shoulderUnderburst,
                              autovalidate: false,
                              keyboardType: TextInputType.number,
                              // controller: _shoulderUnderbustController,
                              onSaved: (String value) =>
                                  _shoulderUnderbustController,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'Half Length'),
                              initialValue: halfLength,
                              autovalidate: false,
                              keyboardType: TextInputType.number,
                              // controller: _halfLengthController,
                              onSaved: (String value) => _halfLengthController,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'Blouse Length'),
                              autovalidate: false,
                              keyboardType: TextInputType.number,
                              initialValue: blouseLength,
                              // controller: _blouseLengthController,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'Skirt Length'),
                              autovalidate: false,
                              keyboardType: TextInputType.number,
                              // controller: _skirtLengthController,
                              initialValue: skirtLength,
                              onSaved: (String value) => _skirtLengthController,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'Gown Length'),
                              autovalidate: false,
                              keyboardType: TextInputType.number,
                              // controller: _gownLengthController,
                              initialValue: gownLength,
                              onSaved: (String value) => _gownLengthController,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Sleeve'),
                              autovalidate: false,
                              keyboardType: TextInputType.number,
                              initialValue: sleeve,
                              // controller: _sleeveController,
                              onSaved: (String value) => _sleeveController,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'Arm Hole'),
                              autovalidate: false,
                              keyboardType: TextInputType.number,
                              initialValue: armHole,
                              // controller: _armHoleController,
                              onSaved: (String value) => _armHoleController,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  labelText: 'Thigh Circumference'),
                              autovalidate: false,
                              keyboardType: TextInputType.number,
                              // controller: _thighCircController,
                              initialValue: thighCirc,
                              onSaved: (String value) => _thighCircController,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  labelText: 'Knee Circumference'),
                              autovalidate: false,
                              keyboardType: TextInputType.number,
                              // controller: _kneeCircController,
                              initialValue: kneeCirc,
                              onSaved: (String value) => _kneeCircController,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'Band Knee'),
                              autovalidate: false,
                              keyboardType: TextInputType.number,
                              initialValue: bandKnee,
                              // controller: _bandKneeController,
                              onSaved: (String value) => _bandKneeController,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  labelText: 'Sole Circumference'),
                              autovalidate: false,
                              keyboardType: TextInputType.number,
                              initialValue: soleCirc,
                              // controller: _soleCircController,
                              onSaved: (String value) => _soleCircController,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'Band Sole'),
                              autovalidate: false,
                              keyboardType: TextInputType.number,
                              initialValue: bandSole,
                              // controller: _bandSoleController,
                              onSaved: (String value) => _bandSoleController,
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
                        color: Colors.black45,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'Place Holder 1'),
                              autovalidate: false,
                              keyboardType: TextInputType.text,
                              // controller: _placeHolder1Controller,
                              initialValue: placeHolder1,
                              onSaved: (String value) =>
                                  _placeHolder1Controller,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Value 1'),
                              autovalidate: false,
                              keyboardType: TextInputType.number,
                              // controller: _value1Controller,
                              initialValue: value1,
                              onSaved: (String value) => _value1Controller,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'Place Holder 2'),
                              autovalidate: false,
                              keyboardType: TextInputType.text,
                              // controller: _placeHolder2Controller,
                              initialValue: placeHolder2,
                              onSaved: (String value) =>
                                  _placeHolder2Controller,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Value 2'),
                              autovalidate: false,
                              keyboardType: TextInputType.number,
                              // controller: _value2Controller,
                              initialValue: value2,
                              onSaved: (String value) => _value2Controller,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'Place Holder 3'),
                              autovalidate: false,
                              keyboardType: TextInputType.text,
                              initialValue: placeHolder3,
                              // controller: _placeHolder3Controller,
                              onSaved: (String value) =>
                                  _placeHolder3Controller,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Value 3'),
                              autovalidate: false,
                              keyboardType: TextInputType.number,
                              initialValue: value3,
                              // controller: _value3Controller,
                              onSaved: (String value) => _value3Controller,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'Place Holder 4'),
                              autovalidate: false,
                              keyboardType: TextInputType.text,
                              initialValue: placeHolder4,
                              // controller: _placeHolder4Controller,
                              onSaved: (String value) =>
                                  _placeHolder4Controller,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Value 4'),
                              autovalidate: false,
                              keyboardType: TextInputType.number,
                              initialValue: value4,
                              // controller: _value4Controller,
                              onSaved: (String value) => _value4Controller,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'Place Holder 5'),
                              autovalidate: false,
                              keyboardType: TextInputType.text,
                              initialValue: placeHolder5,
                              // controller: _placeHolder5Controller,
                              onSaved: (String value) =>
                                  _placeHolder5Controller,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Value 5'),
                              autovalidate: false,
                              keyboardType: TextInputType.number,
                              initialValue: value5,
                              // controller: _value5Controller,
                              onSaved: (String value) => _value5Controller,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'Place Holder 6'),
                              autovalidate: false,
                              keyboardType: TextInputType.text,
                              // controller: _placeHolder6Controller,
                              initialValue: placeHolder6,
                              onSaved: (String value) =>
                                  _placeHolder6Controller,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Value 6'),
                              autovalidate: false,
                              keyboardType: TextInputType.number,
                              initialValue: value6,
                              // controller: _value6Controller,
                              onSaved: (String value) => _value6Controller,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'Place Holder 7'),
                              autovalidate: false,
                              keyboardType: TextInputType.text,
                              initialValue: placeHolder7,
                              // controller: _placeHolder7Controller,
                              onSaved: (String value) =>
                                  _placeHolder7Controller,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Value 7'),
                              autovalidate: false,
                              keyboardType: TextInputType.number,
                              initialValue: value7,
                              // controller: _value7Controller,
                              onSaved: (String value) => _value7Controller,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'Place Holder 8'),
                              autovalidate: false,
                              keyboardType: TextInputType.text,
                              initialValue: placeHolder8,
                              // controller: _placeHolder8Controller,
                              onSaved: (String value) =>
                                  _placeHolder8Controller,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Value 8'),
                              autovalidate: false,
                              keyboardType: TextInputType.number,
                              initialValue: value8,
                              // controller: _value8Controller,
                              onSaved: (String value) => _value8Controller,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
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
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Material(
                                  borderRadius: BorderRadius.circular(40),
                                  // shadowColor: Colors.brown,
                                  color: Colors.black38,
                                  // elevation: 7.0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                      Column(
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
                          Date(_receivedSelectedDate),
                          Container(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                  'Job Recieved date: '
                                  '${_receivedSelectedDate == null ? receivedDate : DateFormat.yMMMEd().format(_receivedSelectedDate).toString()}',
                                  style: TextStyle(fontSize: 18)),
                              Text(
                                  'Job Due date: ' +
                                      '${_dueSelectedDate == null ? dueDate : DateFormat.yMMMEd().format(_dueSelectedDate).toString()}',
                                  style: TextStyle(fontSize: 18)),
                              Text(
                                  'Interval in days: ' +
                                      '${_receivedSelectedDate == null && _dueSelectedDate == null ? 'nill' : _calcDaysLeft(context, _receivedSelectedDate, _dueSelectedDate).toString()}',
                                  style: TextStyle(fontSize: 18)),
                            ],
                          )),
                        ],
                      ),
                      // DateDisplay(
                      //     _receivedSelectedDate, _dueSelectedDate, _interval),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: <Widget>[
                      //     Text('Recived Date'
                      //         //   DateFormat.yMMMEd()
                      //         //       .format(_receivedSelectedDate),
                      //         ),
                      //     Text(
                      //       _dueSelectedDate == null &&
                      //               _receivedSelectedDate == null
                      //           ? 'nill'
                      //           : _calcDaysLeft(
                      //               context,
                      //               _receivedSelectedDate,
                      //               _dueSelectedDate,
                      //             ),
                      //     ),
                      //     Text('Due Date'
                      //         //   DateFormat.yMMMEd()
                      //         //       .format(_dueSelectedDate),
                      //         ),
                      //   ],
                      // )
                    ],
                  ),
                ),
                // TextField(
                //   decoration: InputDecoration(labelText: 'Amount :'),
                //   keyboardType: TextInputType.number,
                //   onChanged: (String value) {
                //     _priceController = int.parse(value);
                //   },
                // ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    _submitNewJob(context);
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Saved!',
                          textAlign: TextAlign.center,
                        ),
                        duration: Duration(
                          seconds: 2,
                        ),
                      ),
                    );
                  },
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
    );
  }
}

class Date extends StatefulWidget {
  DateTime receivedDate;

  Date(this.receivedDate);
  @override
  _DateState createState() => _DateState();
}

class _DateState extends State<Date> {
  @override
  Widget build(BuildContext context) {
    return Text(DateFormat.yMMMEd().format(widget.receivedDate).toString());
  }
}
