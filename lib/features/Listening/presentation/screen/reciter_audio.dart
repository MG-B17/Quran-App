import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/core/util/colors/color_manager.dart';
import 'package:quran/core/util/widgets/app_bar.dart';
import 'package:quran/core/util/widgets/loading.dart';
import 'package:quran/features/Listening/presentation/widget/surah_player_item.dart';
import '../../../../core/util/padding/screen_padding.dart';
import '../controller/cubit.dart';
import '../controller/states.dart';



class ReciterAudio extends StatelessWidget {
  const ReciterAudio({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecitersCubit,RecitersState>(
      listener:(context,state){},
      builder:(context,state){
        if(state is GetRecitersInfoSuccess){
          return Scaffold(
            body: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: ColorManager.primaryColor,
              ),
              child: Padding(
                padding: AppPadding.screenPadding,
                child: Column(
                  children: [
                    MyAppBar(text: state.reciterInfoEntity.reciterName),
                    Expanded(
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                          itemBuilder:(context,index)=>SizedBox(height: 15.h,),
                          separatorBuilder:(context,index)=>SurahPlayerItem(
                              restrictName:state.reciterInfoEntity.reciterName ,
                              id: state.reciterInfoEntity.audioUrl[index].surahId,
                              name:state.reciterInfoEntity.audioUrl[index].surahName,
                              url:state.reciterInfoEntity.audioUrl[index].url
                          ),
                          itemCount:state.reciterInfoEntity.audioUrl.length
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
        else if(state is LoadingGetRecitersInfo) {
          return Container(
            decoration: BoxDecoration(
              gradient: ColorManager.primaryColor
            ),
              child: Center(child: spinKit)
          );
        }else {
          return SizedBox();
        }

      },
    );
  }
}
