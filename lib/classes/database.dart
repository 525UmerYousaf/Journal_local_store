// ignore_for_file: public_member_api_docs, sort_constructors_first
import './journal.dart';

class Database {
  List<Journal> journal;

  Database({required this.journal});

  factory Database.fromJson(Map<String, dynamic> json) => Database(
        journal: List<Journal>.from(
          json["journals"].map(
            (x) => Journal.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "journals": List<dynamic>.from(
          journal.map((x) => x.toJson()),
        ),
      };
}
