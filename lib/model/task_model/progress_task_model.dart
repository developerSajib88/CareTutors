// To parse this JSON data, do
//
//     final progressTaskList = progressTaskListFromJson(jsonString);

import 'dart:convert';

ProgressTaskList progressTaskListFromJson(String str) => ProgressTaskList.fromJson(json.decode(str));

String progressTaskListToJson(ProgressTaskList data) => json.encode(data.toJson());

class ProgressTaskList {
  String status;
  List<Datum> data;

  ProgressTaskList({
    required this.status,
    required this.data,
  });

  factory ProgressTaskList.fromJson(Map<String, dynamic> json) => ProgressTaskList(
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
