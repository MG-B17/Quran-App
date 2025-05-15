class LastSurahPlayEntity {

  final String surahNameAr;
  final String surahNameEn;
  final String restrictName;
  final String url ;
  final String id;

  LastSurahPlayEntity({required this.url,required this.id,required this.surahNameEn,required this.surahNameAr,required this.restrictName});

  factory LastSurahPlayEntity.formJson({required Map<String,dynamic>json}){
    return LastSurahPlayEntity(
        url: json["surahUrl"],
        id: json["id"],
        surahNameEn: json["surahNameEn"],
        surahNameAr: json["surahNameAr"],
        restrictName: json["restrictName"]
    );
  }

  static List<LastSurahPlayEntity> formJsonList({required List<dynamic> jsonList}){
    return jsonList.map((json) => LastSurahPlayEntity.formJson(json:json as Map<String, dynamic>))
        .toList();
  }
}