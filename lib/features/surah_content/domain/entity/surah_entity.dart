class SurahEntity {
  final String audioUrl;
  final String surahName ;
  final String surahNameEn;
  final int totalAya;
  final String revelationPlace;
  final int surahNum;
  final List ayaAr;
  final List ayaEn;

  SurahEntity({
    required this.totalAya,
    required this.revelationPlace,
    required this.audioUrl,
    required this.surahNameEn,
    required this.ayaAr,
    required this.ayaEn,
    required this.surahName,
    required this.surahNum,
});
}