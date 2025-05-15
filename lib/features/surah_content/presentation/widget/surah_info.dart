import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/features/home/presentation/controller/cubit.dart';

import '../../../../core/util/colors/color_manager.dart';

class SurahInfo extends StatefulWidget {
 const SurahInfo({super.key, required this.surahNameAr,required this.totalAya, required this.surahNameEn,required this.place,required this.surahAudioUrl});

  final String surahNameAr;
  final String surahNameEn;
  final String totalAya;
  final String place;
  final String surahAudioUrl;

  @override
  State<SurahInfo> createState() => _SurahInfoState();
}

class _SurahInfoState extends State<SurahInfo> {

  bool isPlay= false;
  final player = AudioPlayer();

  Future<void> playAudio({required String url })async{
    await player.play(UrlSource(url));
  }
  @override
  void dispose(){
    super.dispose();

    player.stop();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150.h,
      foregroundDecoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/stars.png"),
              alignment: Alignment.centerLeft,
              scale: .6,
              opacity: 1
          )
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          gradient: ColorManager.containerColor
      ),
      child:Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            height: 150.h,
            foregroundDecoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/quran_icon.png"),
                    alignment: Alignment.centerLeft,
                    scale: .8,
                    opacity: .8
                )
            ),
            child: Padding(
              padding:EdgeInsets.symmetric(vertical: 10.h,horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 8.h,
                children: [
                  Text(
                    widget.surahNameAr,
                    style: TextStyle(
                        color: ColorManager.secondaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 24.sp
                    ),
                  ),
                  Text(
                    widget.surahNameEn,
                    style: TextStyle(
                        color:ColorManager.secondaryColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    spacing: 5.w,
                    children: [
                      Text(
                        "${widget.totalAya} verses ,",
                        style: TextStyle(
                          color:ColorManager.secondaryColor,
                          fontSize: 20.sp,
                        ),
                      ),
                      Text(
                        widget.place,
                        style: TextStyle(
                          color:ColorManager.secondaryColor,
                          fontSize: 20.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:EdgeInsets.symmetric(vertical: 12.h,horizontal: 16.w),
            child: InkWell(
              onTap: ()async{
                setState(() {
                  isPlay=!isPlay;
                });
                if(isPlay==false){
                 await player.stop();
                }else{
                  playAudio(url: widget.surahAudioUrl);
                  DBCubit.get(context).insertLastPlaySurah(url: widget.surahAudioUrl, id:"", surahNameEn:widget.surahNameEn, surahNameAr:widget.surahNameAr, restrictName:'');
                }
              },
              child: CircleAvatar(
                backgroundColor: ColorManager.indigoColor,
                radius: 25.r,
                child: Icon(
                 isPlay?Icons.pause:Icons.play_arrow,
                  color: ColorManager.secondaryColor,
                  size: 26.sp,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
