// To parse this JSON data, do
//
//     final corans = coransFromJson(jsonString);

import 'dart:convert';
import '/data/models/edition.dart';
import '/data/models/sourate.dart';

Corans coransFromJson(String str) => Corans.fromJson(json.decode(str));

String coransToJson(Corans data) => json.encode(data.toJson());

class Corans {
    int code;
    String status;
  Sourates sourates;

    Corans({
        required this.code,
        required this.status,
        required this.sourates,
    });

    factory Corans.fromJson(Map<String, dynamic> json) => Corans(
        code: json["code"],
        status: json["status"],
        sourates: Sourates.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": sourates.toJson(),
    };
}

class Sourates {
    List<Sourate> listeSourates;
    Edition edition;

    Sourates({
        required this.listeSourates,
        required this.edition,
    });

    factory Sourates.fromJson(Map<String, dynamic> json) => Sourates(
        listeSourates: List<Sourate>.from(json["surahs"].map((x) => Sourate.fromJson(x))),
        edition: Edition.fromJson(json["edition"]),
    );

    Map<String, dynamic> toJson() => {
        "surahs": List<dynamic>.from(listeSourates.map((x) => x.toJson())),
        "edition": edition.toJson(),
    };
}
