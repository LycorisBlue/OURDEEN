import '/data/models/ayat.dart';

class Sourate {
    int number;
    String name;
    String englishName;
    String englishNameTranslation;
    RevelationType revelationType;
    List<Ayah> ayahs;

    Sourate({
        required this.number,
        required this.name,
        required this.englishName,
        required this.englishNameTranslation,
        required this.revelationType,
        required this.ayahs,
    });

    factory Sourate.fromJson(Map<String, dynamic> json) => Sourate(
        number: json["number"],
        name: json["name"],
        englishName: json["englishName"],
        englishNameTranslation: json["englishNameTranslation"],
        revelationType: revelationTypeValues.map[json["revelationType"]]!,
        ayahs: List<Ayah>.from(json["ayahs"].map((x) => Ayah.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "number": number,
        "name": name,
        "englishName": englishName,
        "englishNameTranslation": englishNameTranslation,
        "revelationType": revelationTypeValues.reverse[revelationType],
        "ayahs": List<dynamic>.from(ayahs.map((x) => x.toJson())),
    };
}

enum RevelationType {
    mequoi,
    medine
}

final revelationTypeValues = EnumValues({
    "Meccan": RevelationType.mequoi,
    "Medinan": RevelationType.medine
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}