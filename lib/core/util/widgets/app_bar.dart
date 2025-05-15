import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/color_manager.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key,required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:EdgeInsets.only(top: 40.h),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: ColorManager.indigoColor,
            radius: 22.r,
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(
                  Icons.arrow_back_ios_new,
                  color: ColorManager.secondaryColor,
                  size: 25.sp
              ),
            ),
          ),
          const Spacer(),
          Center(
            child: Text(
              text,
              style: TextStyle(
                  color: ColorManager.secondaryColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          const Spacer(),
          IconButton(
              onPressed: (){
              },
              icon:Icon(
                  null,
                  color: ColorManager.secondaryColor,
                  size: 28.sp
              )
          ),
        ],
      ),
    );
  }
}
