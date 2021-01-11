import 'package:flutter/foundation.dart';
import 'dart:io';

class Job {
  String id;
  String name;
  String address;
  String phoneNumber;
  String styleName;
  String styleDescriptn;
  String styleRefPics;
  String customerPics; 
  String fabricPics;
  String recievedDate;
  String dueDate;
  // Duration daysLeft;
  // String price;
  // String paymentStatus;
  String fabricType;
  // String interval;
  // String isCompleted;
  String shoulder;
  String chest;
  String bust;
  String bustSpan;
  String waist;
  String band;
  String hips;
  String shoulderNipple;
  String shoulderUnderburst;
  String halfLength;
  String blouseLength;
  String skirtLength;
  String gownLength;
  String sleeve;
  String armHole;
  String thighCirc;
  String kneeCirc;
  String bandKnee;
  String soleCirc;
  String bandSole;
  String placeHolder1;
  String value1;
  String placeHolder2;
  String value2;
  String placeHolder3;
  String value3;
  String placeHolder4;
  String value4;
  String placeHolder5;
  String value5;
  String placeHolder6;
  String value6;
  String placeHolder7;
  String value7;
  String placeHolder8;
  String value8;

  Job({
    id,
    @required this.name,
    this.address,
    this.phoneNumber,
    this.styleName,
    this.styleDescriptn,
    this.styleRefPics,
    this.customerPics,
    this.fabricPics,
    this.recievedDate,
    this.dueDate,
    // this.daysLeft,
    // this.price,
    // this.paymentStatus,
    this.fabricType,
    // this.interval,
    // this.isCompleted,
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
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'phonenumber': phoneNumber,
      'stylename': styleName,
      'styledescriptn': styleDescriptn,
      'styleRefPics': styleRefPics,
      'customerPics': customerPics,
      'fabricPics': fabricPics,
      'recievedDate': recievedDate,
      'dueDate': dueDate,
      // 'daysLeft': daysLeft,
      // 'price': price,
      // 'paymentStatus': paymentStatus,
      'fabrictype': fabricType,
      // 'interval': interval,
      // 'isCompleted': isCompleted,
      'shoulder': shoulder,
      'chest': chest,
      'bust': bust,
      'bustSpan': bustSpan,
      'waist': waist,
      'band': band,
      'hips': hips,
      'shouldernipple': shoulderNipple,
      'shoulderunderburst': shoulderUnderburst,
      'halflength': halfLength,
      'blouselength': blouseLength,
      'skirtlength': skirtLength,
      'gownlength': gownLength,
      'sleeve': sleeve,
      'armhole': armHole,
      'thighcirc': thighCirc,
      'kneecirc': kneeCirc,
      'bandKnee': bandKnee,
      'solecirc': soleCirc,
      'bandsole': bandSole,
      'placeholder1': placeHolder1,
      'value1': value1,
      'placeholder2': placeHolder2,
      'value2': value2,
      'placeholder3': placeHolder3,
      'value3': value3,
      'placeholder4': placeHolder4,
      'value4': value4,
      'placeholder5': placeHolder5,
      'value5': value5,
      'placeholder6': placeHolder6,
      'value6': value6,
      'placeholder7': placeHolder7,
      'value7': value7,
      'placeholder8': placeHolder8,
      'value8': value8,
    };
  }
}

class Measurement {
  int id;
  String name;
  String address;
  String phoneNumber;
  String customerPics;
  String recievedDate;
  String shoulder;
  String chest;
  String bust;
  String bustSpan;
  String waist;
  String band;
  String hips;
  String shoulderNipple;
  String shoulderUnderburst;
  String halfLength;
  String blouseLength;
  String skirtLength;
  String gownLength;
  String sleeve;
  String armHole;
  String thighCirc;
  String kneeCirc;
  String bandKnee;
  String soleCirc;
  String bandSole;
  String placeHolder1;
  String value1;
  String placeHolder2;
  String value2;
  String placeHolder3;
  String value3;
  String placeHolder4;
  String value4;
  String placeHolder5;
  String value5;
  String placeHolder6;
  String value6;
  String placeHolder7;
  String value7;
  String placeHolder8;
  String value8;

  Measurement({
    id,
    @required this.name,
    this.address,
    this.phoneNumber,
    this.customerPics,
    this.recievedDate,
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
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'phonenumber': phoneNumber,
      'customerPics': customerPics,
      'recievedDate': recievedDate,
      'shoulder': shoulder,
      'chest': chest,
      'bust': bust,
      'bustSpan': bustSpan,
      'waist': waist,
      'band': band,
      'hips': hips,
      'shouldernipple': shoulderNipple,
      'shoulderunderburst': shoulderUnderburst,
      'halflength': halfLength,
      'blouselength': blouseLength,
      'skirtlength': skirtLength,
      'gownlength': gownLength,
      'sleeve': sleeve,
      'armhole': armHole,
      'thighcirc': thighCirc,
      'kneecirc': kneeCirc,
      'bandKnee': bandKnee,
      'solecirc': soleCirc,
      'bandsole': bandSole,
      'placeholder1': placeHolder1,
      'value1': value1,
      'placeholder2': placeHolder2,
      'value2': value2,
      'placeholder3': placeHolder3,
      'value3': value3,
      'placeholder4': placeHolder4,
      'value4': value4,
      'placeholder5': placeHolder5,
      'value5': value5,
      'placeholder6': placeHolder6,
      'value6': value6,
      'placeholder7': placeHolder7,
      'value7': value7,
      'placeholder8': placeHolder8,
      'value8': value8,
    };
  }
}

class Student {
  int id;
  String name;
  String course;
  Student({this.name, this.course, id});
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'course': course,
    };
  }
}
