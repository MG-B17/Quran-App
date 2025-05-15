import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/core/util/colors/color_manager.dart';

class AzkarItem extends StatelessWidget {
  const AzkarItem({super.key,required this.onTap,required this.image, required this.text1,required this.text2});

  final  String text1;

  final String text2;

  final String image;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.symmetric(vertical: 4.h,),
      child: InkWell(
        onTap: onTap,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width:160.w,
              height:180.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image(
                image: AssetImage(image),
                width:160.w,
                height:180.h,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 180.h,
              width: 160.w,// Match the image height
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                gradient: LinearGradient(
                  colors: [
                    ColorManager.indigoColor,
                    Colors.white.withOpacity(.12),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops:  [0.2, .7],
                ),
              ),
              child:Padding(
                padding:EdgeInsets.symmetric(vertical: 8.h,horizontal: 12.w),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            text1,
                            maxLines: 1,
                            textDirection: TextDirection.rtl,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            text2,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
