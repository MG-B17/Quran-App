import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/color_manager.dart';

class MyErrorWidget extends StatelessWidget {
  const MyErrorWidget({super.key,required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
            color: ColorManager.secondaryColor,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold
        )
        ,)
      ,);
  }
}
