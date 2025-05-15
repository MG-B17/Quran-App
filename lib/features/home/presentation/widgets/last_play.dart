import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/core/util/Strings/Strings.dart';
import 'package:quran/core/util/widgets/error_widget.dart';
import 'package:quran/core/util/widgets/loading.dart';
import 'package:quran/features/home/presentation/controller/cubit.dart';
import 'package:quran/features/home/presentation/controller/state.dart';
import '../../../../core/util/colors/color_manager.dart';

class LastPlay extends StatefulWidget {
  const LastPlay({super.key});

  @override
  State<LastPlay> createState() => _LastPlayState();
}

class _LastPlayState extends State<LastPlay> {

  bool isPlay= false ;

  final player= AudioPlayer();
  Future<void> playAudio({required String url})async{
    await player.play(UrlSource(url));
  }

  @override
  void dispose(){
    super.dispose();

    player.stop();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DBCubit,DBState>(
      listener: (context,state) {},
      builder:(context,state){
        if(state is GetFromDBSuccess){
          return  Container(
            width: double.infinity,
            height: 160.h,
            foregroundDecoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/mosque.png"),
                    fit: BoxFit.cover,
                    opacity: 1
                )
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                gradient: ColorManager.containerColor
            ),
            child:Padding(
              padding:EdgeInsets.symmetric(vertical: 10.h,horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 8.h,
                children: [
                  Text(
                    AppStrings.basmala,
                    style: TextStyle(
                        color: ColorManager.secondaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 24.sp
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10.w,
                    children: [
                      Icon(
                        CupertinoIcons.book_fill,
                        size: 24.sp,
                        color: Colors.white,
                      ),
                      Text(
                        AppStrings.lastPlay,
                        style: TextStyle(
                          color:ColorManager.secondaryColor,
                          fontSize: 20.sp,
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.data.isNotEmpty? state.data[state.data.length-1].surahNameAr:"",
                            style: TextStyle(
                                color:ColorManager.secondaryColor,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            state.data.isNotEmpty? state.data[state.data.length-1].surahNameEn:"",
                            style: TextStyle(
                              color: Colors.grey[300],
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      state.data.isNotEmpty? InkWell(
                        onTap: ()async{
                          setState(() {
                            isPlay=!isPlay;
                          });
                          if(isPlay==false){
                            await player.stop();
                          }else{
                            playAudio(url: state.data[state.data.length-1].url);
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
                      ):SizedBox(),
                    ],
                  )
                ],
              ),
            ),
          );
        }else if(state is Loading){
          return Center(child: spinKit,);
        }else if (state is GetFromDBFail){
          return MyErrorWidget(text: state.message);
        }else {
          return SizedBox();
        }
      } ,
    );
  }
}
