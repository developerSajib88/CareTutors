
import 'dart:convert';

CancelTaskList cancelTaskListFromJson(String str) => CancelTaskList.fromJson(json.decode(str));

String cancelTaskListToJson(CancelTaskList data) => json.encode(data.toJson());

class CancelTaskList {
  String status;
  List<Datum> data;

  CancelTaskList({
    required this.status,
    required this.data,
  });

  factory CancelTaskList.fromJson(Map<String, dynamic> json) => CancelTaskList(
    status: json["status"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String id;
  String title;
  String description;
  String status;
  String createdDate;

  Datum({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.createdDate,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    title: json["title"],
    description: json["description"],
    status: json["status"],
    createdDate: json["createdDate"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "description": description,
    "status": status,
    "createdDate": createdDate,
  };
}
