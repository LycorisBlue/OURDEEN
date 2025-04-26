class Ayah {
    int number;
    String? audio;
    List<String>? audioSecondary;
    String text;
    int numberInSurah;
    int juz;
    int manzil;
    int page;
    int ruku;
    int hizbQuarter;
    dynamic sajda;

    Ayah({
        required this.number,
        required this.audio,
        required this.audioSecondary,
        required this.text,
        required this.numberInSurah,
        required this.juz,
        required this.manzil,
        required this.page,
        required this.ruku,
        required this.hizbQuarter,
        required this.sajda,
    });

    factory Ayah.fromJson(Map<String, dynamic> json) => Ayah(
        number: json["number"],
        audio: json["audio"],
        audioSecondary: json["audioSecondary"] == null ? [] : List<String>.from(json["audioSecondary"].map((x) => x)),
        text: json["text"],
        numberInSurah: json["numberInSurah"],
        juz: json["juz"],
        manzil: json["manzil"],
        page: json["page"],
        ruku: json["ruku"],
        hizbQuarter: json["hizbQuarter"],
        sajda: json["sajda"],
    );

    Map<String, dynamic> toJson() => {
        "number": number,
        "audio": audio,
        "audioSecondary": List<dynamic>.from(audioSecondary!.map((x) => x)),
        "text": text,
        "numberInSurah": numberInSurah,
        "juz": juz,
        "manzil": manzil,
        "page": page,
        "ruku": ruku,
        "hizbQuarter": hizbQuarter,
        "sajda": sajda,
    };
}