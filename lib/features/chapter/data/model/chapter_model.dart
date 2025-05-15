import 'package:quran/features/chapter/domain/entity/chapter_entity.dart';

class ChapterModel extends ChapterEntity{

  final String surahArName;

  final String surahEnName;

  final int total;

  final String place;

  final String surahNameTranslation;

  ChapterModel({
    required this.surahEnName,
    required this.surahArName,
    required this.place,
    required this.surahNameTranslation,
    required this.total,

  }):super(
      totalAya:total,
      surahNameArabicLong:surahArName,
      surahNameEn:surahEnName ,
      revelationPlace:place
  );


  factory ChapterModel.formJson({required Map<String,dynamic> json}){
    return ChapterModel(
        surahEnName: json["surahName"],
        surahArName: json["surahNameArabic"],
        place: json["revelationPlace"],
        surahNameTranslation: json["surahNameTranslation"],
        total: json["totalAyah"]
    );
  }

  static List<ChapterModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => ChapterModel.formJson(json: json)).toList();
  }

}