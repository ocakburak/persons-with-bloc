import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelp {
  static final String databaseName = "guide.sqlite";

  static Future<Database> databaseConnect() async {
    String databasePath = join(
      await getDatabasesPath(),
      databaseName,
    );

    if (await databaseExists(databasePath)) {
      print('You have database, do not copy!');
    } else {
      ByteData data = await rootBundle.load("database/$databaseName");
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(databasePath).writeAsBytes(bytes, flush: true);
      print("Copy database");
    }

    return openDatabase(databasePath);
  }
}
