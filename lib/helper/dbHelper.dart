import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

import '../model/model.dart';

// class DBHelper {
//   static Future<sql.Database> database() async {
//     final dbPath = await sql.getDatabasesPath();
//     return sql.openDatabase(path.join(dbPath, 'kalon.db'),
//         onCreate: (db, version) {
//       return db.execute(
//         'CREATE TABLE user_jobs(id TEXT PRIMARYKEY, name TEXT, address TEXT, phonenumber TEXT, stylename TEXT, styledescription TEXT, stylerefpics TEXT, shoulder INTEGER, chest INTEGER, bust INTEGER, bustspan INTEGER, waist INTEGER, band INTEGER, hips INTEGER, shouldernipple INTEGER, shoulderunderbust INTEGER, halflength INTEGER, blouselength INTEGER, skirtlength INTEGER, gownlength INTEGER, sleeve INTEGER, armhole INTEGER, thighcirc INTEGER, kneecirc INTEGER, bandknee INTEGER, solecirc INTEGER, bandsole INTEGER, recdate TEXT, duedate TEXT, daysleft TEXT, price INTEGER, paymentstat TEXT, fabrictype TEXT, customerpic TEXT,fabricpic TEXT, interval TEXT, placeholder1 TEXT, value1 INTEGER, placeholder2 TEXT, value2 INTEGER, placeholder3 TEXT, value3 INTEGER, placeholder4 TEXT, value4 INTEGER, placeholder5 TEXT, value5 INTEGER, placeholder6 TEXT, value6 INTEGER, placeholder7 TEXT, value7 INTEGER, placeholder8 TEXT, value8 INTEGER,)',
//       );
//     }, version: 1);
//   }

//   static Future<void> insert(String table, Map<String, Object> data) async {
//     final db = await DBHelper.database();
//     db.insert(
//       table,
//       data,
//       conflictAlgorithm: sql.ConflictAlgorithm.replace,
//     );
//   }

//   static Future<List<Map<String, dynamic>>> getData(String table) async {
//     final db = await DBHelper.database();
//     return db.query(table);
//   }
// }

class DbJobManager {
  Database _database;

  Future openDb() async {
    if (_database == null) {
      _database = await openDatabase(
          join(await getDatabasesPath(), "jobDatabase.db"),
          version: 1, onCreate: (Database db, int version) async {
        await db.execute(
            "CREATE TABLE jobDatabase (id TEXT, name TEXT, address TEXT, phoneNumber TEXT, styleName TEXT, styleDescriptn TEXT, styleRefPics TEXT, customerPics TEXT, fabricPics TEXT, recievedDate TEXT, dueDate TEXT, fabricType TEXT, shoulder TEXT, chest TEXT, bust TEXT, bustSpan TEXT, waist TEXT, band TEXT, hips TEXT, shoulderNipple TEXT, shoulderUnderburst TEXT, halfLength TEXT, blouseLength TEXT, skirtLength TEXT, gownLength TEXT, sleeve TEXT, armHole TEXT, thighCirc TEXT, kneeCirc TEXT, bandKnee TEXT, soleCirc TEXT, bandSole TEXT, placeHolder1 TEXT, value1 TEXT, placeHolder2 TEXT, value2 TEXT, placeHolder3 TEXT, value3 TEXT, placeHolder4 TEXT, value4 TEXT, placeHolder5 TEXT, value5 TEXT, placeHolder6 TEXT, value6 TEXT, placeHolder7 TEXT, value7 TEXT, placeHolder8 TEXT, value8 TEXT)");
      });
    }
  }

  Future<int> insertJob(Job job) async {
    await openDb();
    return await _database.insert('jobDatabase', job.toMap());
  }

  Future<List<Job>> getJobsList() async {
    await openDb();
    final List<Map<String, dynamic>> maps =
        await _database.query('jobDatabase');
    return List.generate(maps.length, (i) {
      return Job(
        id: maps[i]['id'],
        name: maps[i]['name'],
        address: maps[i]['address'],
        phoneNumber: maps[i]['phoneNumber'],
        styleName: maps[i]['styleName'],
        styleDescriptn: maps[i]['styleDescriptn'],
        styleRefPics: maps[i]['styleRefPics'],
        recievedDate: maps[i]['recievedDate'],
        dueDate: maps[i]['dueDate'],
        // daysLeft: maps[i]['daysLeft'],
        // price: maps[i]['price'],
        // paymentStatus: maps[i]['paymentStatus'],
        fabricType: maps[i]['fabricType'],
        customerPics: maps[i]['customerPics'],
        fabricPics: maps[i]['fabricPics'],
        // interval: maps[i]['interval'],
        // isCompleted: maps[i]['isCompleted'],
        shoulder: maps[i]['shoulder'],
        chest: maps[i]['chest'],
        bust: maps[i]['bust'],
        bustSpan: maps[i]['bustSpan'],
        waist: maps[i]['waist'],
        band: maps[i]['band'],
        hips: maps[i]['hips'],
        shoulderNipple: maps[i]['shoulderNipple'],
        shoulderUnderburst: maps[i]['shoulderUnderburst'],
        halfLength: maps[i]['halfLength'],
        blouseLength: maps[i]['blouseLength'],
        skirtLength: maps[i]['skirtLength'],
        gownLength: maps[i]['gownLength'],
        sleeve: maps[i]['sleeve'],
        armHole: maps[i]['armHole'],
        thighCirc: maps[i]['thighCirc'],
        kneeCirc: maps[i]['kneeCirc'],
        bandKnee: maps[i]['bandKnee'],
        soleCirc: maps[i]['soleCirc'],
        bandSole: maps[i]['bandSole'],
        placeHolder1: maps[i]['placeHolder1'],
        placeHolder2: maps[i]['placeHolder2'],
        placeHolder3: maps[i]['placeHolder3'],
        placeHolder4: maps[i]['placeHolder4'],
        placeHolder5: maps[i]['placeHolder5'],
        placeHolder6: maps[i]['placeHolder6'],
        placeHolder7: maps[i]['placeHolder7'],
        placeHolder8: maps[i]['placeHolder8'],
        value1: maps[i]['value1'],
        value2: maps[i]['value2'],
        value3: maps[i]['value3'],
        value4: maps[i]['value4'],
        value5: maps[i]['value5'],
        value6: maps[i]['value6'],
        value7: maps[i]['value7'],
        value8: maps[i]['value8'],
      );
    });
  }

  Future<int> upDateJobList(Job job) async {
    await openDb();
    return await _database.update('jobDatabase', job.toMap(),
        where: "id = ?", whereArgs: [job.id]);
  }

  Future<void> deleteJobItem(int id) async {
    await openDb();
    await _database.delete('jobDatabase', where: "id = ?", whereArgs: [id]);
  }
}

class DbMeasrementManager {
  Database _database;

  Future openDb() async {
    if (_database == null) {
      _database = await openDatabase(
          join(await getDatabasesPath(), "measurement.db"),
          version: 1, onCreate: (Database db, int version) async {
        await db.execute(
            "CREATE TABLE measurement (id INTEGER PRIMARYKEY, name TEXT, address TEXT, phoneNumber TEXT, customerPics TEXT, recievedDate TEXT, shoulder TEXT, chest TEXT, bust TEXT, bustSpan TEXT, waist TEXT, band TEXT, hips TEXT, shoulderNipple TEXT, shoulderUnderburst TEXT, halfLength TEXT, blouseLength TEXT, skirtLength TEXT, gownLength TEXT, sleeve TEXT, armHole TEXT, thighCirc TEXT, kneeCirc TEXT, bandKnee TEXT, soleCirc TEXT, bandSole TEXT, placeHolder1 TEXT, value1 TEXT, placeHolder2 TEXT, value2 TEXT, placeHolder3 TEXT, value3 TEXT, placeHolder4 TEXT, value4 TEXT, placeHolder5 TEXT, value5 TEXT, placeHolder6 TEXT, value6 TEXT, placeHolder7 TEXT, value7 TEXT, placeHolder8 TEXT, value8 TEXT)");
      });
    }
  }

  Future<int> insertMeasurement(Measurement measurement) async {
    await openDb();
    return await _database.insert('measurement', measurement.toMap());
  }

  Future<List<Measurement>> getMeasurementList() async {
    await openDb();
    final List<Map<String, dynamic>> maps =
        await _database.query('measurement');
    return List.generate(maps.length, (i) {
      return Measurement(
        id: maps[i]['id'],
        name: maps[i]['name'],
        address: maps[i]['address'],
        phoneNumber: maps[i]['phoneNumber'],
        recievedDate: maps[i]['recievedDate'],
        customerPics: maps[i]['customerPics'],
        shoulder: maps[i]['shoulder'],
        chest: maps[i]['chest'],
        bust: maps[i]['bust'],
        bustSpan: maps[i]['bustSpan'],
        waist: maps[i]['waist'],
        band: maps[i]['band'],
        hips: maps[i]['hips'],
        shoulderNipple: maps[i]['shoulderNipple'],
        shoulderUnderburst: maps[i]['shoulderUnderburst'],
        halfLength: maps[i]['halfLength'],
        blouseLength: maps[i]['blouseLength'],
        skirtLength: maps[i]['skirtLength'],
        gownLength: maps[i]['gownLength'],
        sleeve: maps[i]['sleeve'],
        armHole: maps[i]['armHole'],
        thighCirc: maps[i]['thighCirc'],
        kneeCirc: maps[i]['kneeCirc'],
        bandKnee: maps[i]['bandKnee'],
        soleCirc: maps[i]['soleCirc'],
        bandSole: maps[i]['bandSole'],
        placeHolder1: maps[i]['placeHolder1'],
        placeHolder2: maps[i]['placeHolder2'],
        placeHolder3: maps[i]['placeHolder3'],
        placeHolder4: maps[i]['placeHolder4'],
        placeHolder5: maps[i]['placeHolder5'],
        placeHolder6: maps[i]['placeHolder6'],
        placeHolder7: maps[i]['placeHolder7'],
        placeHolder8: maps[i]['placeHolder8'],
        value1: maps[i]['value1'],
        value2: maps[i]['value2'],
        value3: maps[i]['value3'],
        value4: maps[i]['value4'],
        value5: maps[i]['value5'],
        value6: maps[i]['value6'],
        value7: maps[i]['value7'],
        value8: maps[i]['value8'],
      );
    });
  }

  Future<int> upDateMeasurementList(Measurement measurement) async {
    await openDb();
    return await _database.update('measurement', measurement.toMap(),
        where: "id = ?", whereArgs: [measurement.id]);
  }

  Future<void> deleteMeasurementItem(int id) async {
    await openDb();
    await _database.delete('measurement', where: "id = ?", whereArgs: [id]);
  }
}

class DbStudent {
  Database _database;

  Future openDb() async {
    if (_database == null) {
      _database = await openDatabase(
          join(await getDatabasesPath(), "student.db"),
          version: 1, onCreate: (Database db, int version) async {
        await db.execute(
            "CREATE TABLE student (id INTEGER PRIMARYKEY, name TEXT, course TEXT)");
      });
    }
  }

  Future<int> insertStudent(Student student) async {
    await openDb();
    return await _database.insert('student', student.toMap());
  }

  Future<List<Student>> getStudent() async {
    await openDb();
    final List<Map<String, dynamic>> maps = await _database.query('student');
    return List.generate(maps.length, (i) {
      return Student(
        id: maps[i]['id'],
        name: maps[i]['name'],
        course: maps[i]['course'],
      );
    });
  }

  Future<int> upDateJobList(Student student) async {
    await openDb();
    return await _database.update('student', student.toMap(),
        where: "id = ?", whereArgs: [student.id]);
  }

  Future<void> deleteJobItem(int id) async {
    await openDb();
    await _database.delete('student', where: "id = ?", whereArgs: [id]);
  }
}
