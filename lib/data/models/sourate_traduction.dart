// To parse this JSON data, do
//
//     final sourateTraduction = sourateTraductionFromJson(jsonString);

import 'dart:convert';

import '/data/models/sourate.dart';

SourateTraduction sourateTraductionFromJson(String str) => SourateTraduction.fromJson(json.decode(str));

String sourateTraductionToJson(SourateTraduction data) => json.encode(data.toJson());

class SourateTraduction {
    int code;
    String status;
    Sourate sourate;

    SourateTraduction({
        required this.code,
        required this.status,
        required this.sourate,
    });

    factory SourateTraduction.fromJson(Map<String, dynamic> json) => SourateTraduction(
        code: json["code"],
        status: json["status"],
        sourate: Sourate.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": sourate.toJson(),
    };
}