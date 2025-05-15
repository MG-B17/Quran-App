import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../../features/home/domain/entity/last_surah_play_entity.dart';

class SqfliteHelper {
  static Database? dataBase;

  static Future<String> getDatabasePath() async {
    final directory = await getApplicationDocumentsDirectory();
    return join(directory.path, 'quran.db');
  }

  static Future<Database> initializeDatabase() async {
    final dbPath = await getDatabasePath();
    return await openDatabase(
        dbPath,
        version: 1,
        onCreate: (db, version) async {
          await db.execute(
            "CREATE TABLE lastSurahPlay ("
                "id TEXT , "
                "surahNameAr TEXT, "
                "surahNameEn TEXT, "
                "surahUrl TEXT, "
                "restrictName TEXT "
                ")",
          );
          print('Table created');
        },
        onOpen: (db) {
          print('Database opened');
        });
  }


  static Future<void> createDatabase() async {
    try {
      dataBase = await initializeDatabase();
    } catch (e) {
      print('Error creating database: $e');
    }
  }


  static void insertIntoDB({required LastSurahPlayEntity data}) async {
    try {
      if (dataBase == null) {
        print('Database is not initialized');
        return;
      }
      await dataBase?.transaction((txn) async {
        await txn.rawInsert(
          "INSERT INTO lastSurahPlay ("
              "id , "
              "surahNameAr , "
              "surahNameEn , "
              "surahUrl , "
              "restrictName "
              ")"
              "VALUES (?,?, ?, ?, ?)",
          [data.id,data.surahNameAr,data.surahNameAr,data.url,data.restrictName],
        ).then((value){
          print("added successfully");
        }).catchError((error){
          print(error);
        });
      });
      print('Data inserted successfully: done');
    } catch (e) {
      print('Error inserting data: $e');
    }
  }


  static Future<List<Map<String, dynamic>>> getDataFromDB() async {
    try {
      if (dataBase == null) {
        print('Database is not initialized');
        return [];
      }

      final List<Map<String, dynamic>> data = await dataBase!.query('lastSurahPlay');
      print('Data retrieved successfully: $data');
      return data;
    } catch (e) {
      print('Error retrieving data: $e');
      return [];
    }
  }

  static Future<void> deleteFromDB({required int id}) async {
    try {
      if (dataBase == null) {
        print('Database is not initialized');
        return;
      }

      int result = await dataBase!.delete(
        'lastSurahPlay', // Table name
        where: 'id = ?', // Condition
        whereArgs: [id], // Arguments for the condition
      );

      if (result > 0) {
        print('Record with id $id deleted successfully');
      } else {
        print('No record found with id $id');
      }
    } catch (e) {
      print('Error deleting data: $e');
    }
  }


  static Future<void> deleteDatabaseFile() async {
    try {
      final dbPath = await getDatabasePath();
      await deleteDatabase(dbPath);
      print('Database successfully deleted');
    } catch (e) {
      print('Error deleting database: $e');
    }
  }

  static void deleteDB() async {
    try {
      await deleteDatabaseFile();
    } catch (e) {
      print('Error deleting database: $e');
    }
  }

}