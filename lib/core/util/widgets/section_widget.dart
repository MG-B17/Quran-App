import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../colors/color_manager.dart';

class SectionWidget extends StatelessWidget {
 const SectionWidget({super.key,required this.onTap,required this.image,required this.text1,required this.text2});

 final  String text1;

 final String text2;

 final String image;

 final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.symmetric(vertical: 10.h,),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width:150.w,
          height:140.h,
          foregroundDecoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(image),
                  scale: .9,
                  alignment: Alignment.bottomRight,
                  opacity: .7
              )
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              gradient: ColorManager.containerColor
          ),
          child: Container(
            foregroundDecoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/stars.png"),
                    scale: .7,
                    opacity: 1
                )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  text1,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: ColorManager.secondaryColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  text2,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.grey[300],
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold
                  ),
                ),
                const Spacer(),
                Padding(
                  padding:EdgeInsets.symmetric(vertical: 8.h,horizontal: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: ColorManager.indigoColor,
                        radius: 22.r,
                        child:Icon(
                          Icons.arrow_forward_ios,
                          color: ColorManager.secondaryColor,
                          size: 24.sp,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
