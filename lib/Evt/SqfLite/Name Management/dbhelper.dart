import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'modelclass.dart';

class DatabaseHelper {
  static DatabaseHelper databaseHelper; // The object of the class that will get passed around
  static Database database; // built in database class from sqflite.dart

  String dbtable = "name_tb";
  String colid = "id";
  String colname = "name";

  DatabaseHelper.CreateInstance();

  factory DatabaseHelper() {
    if (databaseHelper==null) {
      databaseHelper = DatabaseHelper.CreateInstance(); // Creating instance of the object if null
    }
    return databaseHelper;
  }

  Future<Database> getdatabase() async {
    if (database==null) {
      database= await initializeDatabase();
    }
    return database;
  }

  Future<Database> initializeDatabase() async {
    Directory dbdirectory = await getApplicationDocumentsDirectory();
    String path = dbdirectory.path + "name.db";
    var namedatabase = await openDatabase(path,version: 1,onCreate: createdb);
    return namedatabase;
  }

  void createdb(Database db,int newversion) async {
    await db.execute("CREATE TABLE $dbtable($colid INTEGER PRIMARY KEY AUTOINCREMENT, $colname VARCHAR(50) NOT NULL)");
  }

  // Fetch Operation
  Future<List<Map<String,dynamic>>>getNameMapList() async {
    Database db = await getdatabase();
    // var result = await db.rawQuery("SELECT * FROM $dbtable ORDER BY $colname ASC");
    var result = await db.query(dbtable,orderBy: "$colname ASC");
    return result;
  }

  // Insert Operation
  Future<int> insertname(namemodel model) async {
    Database db = await getdatabase();
    String newname = model.getname();
    var result = await db.rawInsert("INSERT INTO $dbtable ($colname) VALUES ('$newname')");
    return result;
  }

  // Update Operation
  Future<int> updatename(namemodel model) async {
    Database db = await getdatabase();
    String nameupdate = model.getname();
    int idupdate = model.getid();
    var result = await db.rawUpdate("UPDATE $dbtable SET $colname = '$nameupdate' WHERE $colid = '$idupdate'");
    debugPrint("the id "+ model.getid().toString()+" updated");
    return result;
  }

  Future<int> deletename(namemodel model) async{
    Database db = await getdatabase();
    int newid = model.getid();
    var result = await db.rawDelete("DELETE FROM $dbtable WHERE $colid = $newid");
    debugPrint("the id "+ newid.toString()+" deleted");
    return result;
  }

  Future<int> getlength() async {
    Database db = await getdatabase();
    List<Map<String,dynamic>> total = await db.rawQuery("SELECT COUNT (*) FROM $dbtable");
    int result = Sqflite.firstIntValue(total);
    return result;
  }

  Future<List<namemodel>> getnamelist() async {
    var namemaplist = await getNameMapList();
    int count = namemaplist.length;
    List<namemodel> namelist = List();
    for (var i = 0; i < count; i++) {
      namelist.add(namemodel.frommapobject(namemaplist[i]));
    }
    return namelist;
  } 
}