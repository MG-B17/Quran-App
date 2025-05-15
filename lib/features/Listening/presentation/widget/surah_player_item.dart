import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/core/util/widgets/number_muslim_widegt.dart';
import 'package:quran/features/home/presentation/controller/cubit.dart';

import '../../../../core/util/colors/color_manager.dart';

class SurahPlayerItem extends StatefulWidget {
const SurahPlayerItem({super.key,required this.name,required this.url,required this.id,required this.restrictName});

  final String name;
  final String url;
  final String id;
  final String restrictName;

  @override
  State<SurahPlayerItem> createState() => _SurahPlayerItemState();
}

class _SurahPlayerItemState extends State<SurahPlayerItem> {


  bool isPlay = false;

  final player= AudioPlayer();

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
      decoration: BoxDecoration(
        border: Border.all(color: ColorManager.myBlue, width: 2.5.w),
        borderRadius: BorderRadius.circular(12.w), // Adjust radius as needed
      ),
      child: Padding(
        padding:EdgeInsets.symmetric(vertical: 5.h,horizontal: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          spacing: 12.w,
          children: [
            InkWell(
              onTap: ()async{
                setState(() {
                  isPlay =! isPlay;
                });
                if(isPlay==false){
                  await player.stop();
                }else{
                  playAudio(url: widget.url);
                  DBCubit.get(context).insertLastPlaySurah(url: widget.url, id:widget.id, surahNameEn:"", surahNameAr:widget.name, restrictName:widget.restrictName);
                }
              },
              child: Icon(
                isPlay?Icons.pause: Icons.play_circle_outline,
                color: ColorManager.secondaryColor,
                size: 30.sp,
              ),
            ),
            const Spacer(),
            Text(
              widget.name,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                  color: ColorManager.secondaryColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold
              ),
            ),
            NumberMuslimWidget(number:widget.id)
          ],
        ),
      ),
    );
  }
}
