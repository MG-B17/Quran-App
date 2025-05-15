import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/core/util/colors/color_manager.dart';
import 'package:quran/core/util/padding/screen_padding.dart';
import 'package:quran/core/util/widgets/app_bar.dart';
import 'package:quran/core/util/widgets/my_divider.dart';

class AzkarContent extends StatelessWidget {
const AzkarContent({super.key,required this.json,required this.name,required this.image});

 final String name;

 final String image;

 final List<Map<String,dynamic>>json ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: ColorManager.primaryColor
        ),
        child: Padding(
          padding: AppPadding.screenPadding,
          child: Column(
            children: [
              MyAppBar(text:name),
              Expanded(
                child: Padding(
                  padding:EdgeInsets.symmetric(vertical:12.h,),
                  child: Container(
                    foregroundDecoration: BoxDecoration(
                      image: DecorationImage(
                          image:AssetImage(image),
                          fit: BoxFit.cover,
                          scale: .9,
                          opacity: .18,
                        isAntiAlias: true
                      )
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: ColorManager.myBlue,width: 2.w,)
                    ),
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 16.w),
                        itemBuilder:(context,index)=>Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              json[index]["text"],
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                color: ColorManager.secondaryColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                 "كررها ${json[index]["count"]}",
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(
                                      color: ColorManager.myBlue,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        separatorBuilder:(context,index)=>Column(
                          children: [
                            SizedBox(
                              height: 10.h,
                            ),
                            MyDivider(),
                            SizedBox(
                              height: 10.h,
                            ),
                          ],
                        ),
                        itemCount: json.length
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
