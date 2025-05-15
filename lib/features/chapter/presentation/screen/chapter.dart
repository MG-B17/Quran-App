import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/config/navigation/navigator_class.dart';
import 'package:quran/core/util/Strings/Strings.dart';
import 'package:quran/core/util/colors/color_manager.dart';
import 'package:quran/core/util/padding/screen_padding.dart';
import 'package:quran/core/util/widgets/app_bar.dart';
import 'package:quran/core/util/widgets/error_widget.dart';
import 'package:quran/core/util/widgets/icon_quran_image.dart';
import 'package:quran/core/util/widgets/loading.dart';
import 'package:quran/core/util/widgets/my_divider.dart';
import 'package:quran/features/chapter/presentation/controller/chapter_cubit.dart';
import 'package:quran/features/chapter/presentation/controller/chapter_state.dart';
import 'package:quran/features/surah_content/presentation/screen/surah_content.dart';

import '../widget/chapter_item.dart';

class Chapter extends StatelessWidget {
  const Chapter({super.key});

  @override
  Widget build(BuildContext context) {
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
              MyAppBar(text: AppStrings.quran),
              IconQuranImage(),
              BlocConsumer<ChapterCubit,ChapterState>(
                listener:(context,state){},
                builder:(context,state){
                  if(state is GetAllChapterSuccess){
                    return Expanded(
                      child: ListView.separated(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemBuilder: (context,index)=>ChapterItem(
                              onTap: (){
                                PushNavigation().navigation(context: context, screen:SurahContent(number:index+1,));
                              },
                              surahArName:state.result[index].surahNameArabicLong,
                              surahEnName:state.result[index].surahNameEn,
                              surahNumber:"${index+1}" ,
                              verses:"${state.result[index].totalAya} verses"
                          ),
                          separatorBuilder:(context,index)=>MyDivider(),
                          itemCount: 114
                      ),
                    );
                  }
                  else if(state is LoadingGetChapter){
                    return Center(child: spinKit);
                  }else if (state is GetAllChapterFail){
                    return MyErrorWidget(text: state.message);
                  }else {
                    return SizedBox();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
