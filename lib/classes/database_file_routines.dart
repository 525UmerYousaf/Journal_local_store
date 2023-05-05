// ignore_for_file: avoid_print
import 'package:path_provider/path_provider.dart'; //  File-system locations
import 'dart:io'; //  Used by File
import 'dart:convert'; //  Used for JSON

import './database.dart';

class DatabaseFileRoutine {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/local_persistence.json');
  }

  Future<String> readJournals() async {
    try {
      final file = await _localFile;
      if (!file.existsSync()) {
        print("File does not Exist: ${file.absolute}");
        await writeJournals('{"journals}: []');
      }
      //  Successfully read the file
      String contents = await file.readAsString();
      return contents;
    } catch (e) {
      print("Error reading journal: $e");
      return "";
    }
  }

  Future<File> writeJournals(String json) async {
    final file = await _localFile;
    //  Writing the file.
    return file.writeAsString(json);
  }
}

//  To read & parse from JSON data.
Database databaseFromJson(String str) {
  final dataFromJson = json.decode(str);
  return Database.fromJson(dataFromJson);
}

//  To save & parse to JSON data.
String databaseToJson(Database data) {
  final dataToJson = data.toJson();

  return json.encode(dataToJson);
}
