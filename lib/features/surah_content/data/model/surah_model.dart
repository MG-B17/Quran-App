import 'package:quran/features/surah_content/domain/entity/surah_entity.dart';

class SurahModel extends SurahEntity{
  final String surahNameEN;
  final String surahNameAr;
  final String surahNameTranslation;
  final String place;
  final int surahNumber;
  final int total;
  final String audio ;
  final List ayaArabic;
  final List ayaEnglish;

  SurahModel({
    required this.surahNumber,
    required this.place,
    required this.total,
    required this.surahNameTranslation,
    required this.audio,
    required this.ayaArabic,
    required this.ayaEnglish,
    required this.surahNameAr,
    required this.surahNameEN,

}):super(
    surahNameEn:surahNameEN,
    surahName:surahNameAr ,
    surahNum: surahNumber,
    audioUrl: audio,
    ayaAr:ayaArabic ,
    ayaEn:ayaEnglish ,
    totalAya:total ,
    revelationPlace: place
  );

  factory SurahModel.formJson({required Map<String,dynamic>json}){
    return SurahModel(
        surahNumber:json["surahNo"],
        place:json["revelationPlace"],
        total:json["totalAyah"],
        surahNameTranslation:json["surahNameTranslation"],
        audio:json["audio"]["4"]["originalUrl"],
        ayaArabic:json["arabic1"],
        ayaEnglish:json["english"],
        surahNameAr:json["surahNameArabic"],
        surahNameEN:json["surahName"]
    );
  }
}