import 'package:quran/features/Listening/domain/entity/audio_url.dart';

class ReciterInfoEntity {
  final String reciterName ;
  final String reciterId ;
  final List<AudioUrlEntity> audioUrl ;

  ReciterInfoEntity({required this.audioUrl,required this.reciterId,required this.reciterName});
}