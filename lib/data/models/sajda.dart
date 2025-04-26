class SajdaClass {
    int id;
    bool recommended;
    bool obligatory;

    SajdaClass({
        required this.id,
        required this.recommended,
        required this.obligatory,
    });

    factory SajdaClass.fromJson(Map<String, dynamic> json) => SajdaClass(
        id: json["id"],
        recommended: json["recommended"],
        obligatory: json["obligatory"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "recommended": recommended,
        "obligatory": obligatory,
    };
}
