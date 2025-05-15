import 'package:quran/features/Listening/data/model/url_info.dart';
import 'package:quran/features/Listening/domain/entity/reciter_info.dart';

import '../../domain/entity/audio_url.dart';

class ReciterInfoModel extends ReciterInfoEntity{

  final String reciterName;
  final String id ;
  final List<UrlInfoModel> urlInfo;

  ReciterInfoModel({required this.id,required this.reciterName,required this.urlInfo}):super(
    reciterId:id ,
    reciterName: reciterName,
    audioUrl:urlInfo.map((url)=>AudioUrlEntity(
      surahId: url.surahId,
      surahName: url.surahName,
      url: url.url,
    )).toList()
  );

  factory ReciterInfoModel.formJson({required Map<String,dynamic>json}){
    return ReciterInfoModel(
        id: json["reciter_id"],
        reciterName:json["reciter_name"],
        urlInfo: UrlInfoModel.formJsonList(jsonList: json["audio_urls"])
    );
  }
}