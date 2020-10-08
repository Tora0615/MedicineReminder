

import 'package:medicine/database/pills_database.dart';
import 'package:sqflite/sqflite.dart';

class Repository{

  PillsDatabase _pillsDatabase = PillsDatabase();
  static Database _database;

  //init database
  Future<Database> get database async{
    if(_database != null) return _database;
    _database = await _pillsDatabase.setDatabase();
    return _database;
  }

  Future<int> insertData(String table,Map<String,dynamic> data) async{
    Database db = await database;
    try{
      return await db.insert(table, data);
    }catch(e){
      return null;
    }
  }


}