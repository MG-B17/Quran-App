class UrlInfoModel {
  final String url;
  final String surahName;
  final String surahId;

  UrlInfoModel({required this.surahId,required this.url,required this.surahName});

  factory UrlInfoModel.formJson ({required Map<String,dynamic> json}){
    return UrlInfoModel(
        surahId:json["surah_id"] ,
        url:json["audio_url"],
        surahName:json["surah_name_ar"]
    );
  }

  static List<UrlInfoModel> formJsonList ({required List<dynamic> jsonList}){
    return jsonList.map((json)=>UrlInfoModel.formJson(json: json)).toList();
  }
}