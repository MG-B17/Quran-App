import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/color_manager.dart';

class NumberMuslimWidget extends StatelessWidget {
  const NumberMuslimWidget({super.key,required this.number});

  final String number;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55.w,
      height: 50.h,
      foregroundDecoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/muslim .png"),
              fit:BoxFit.cover
          )
      ),
      child: Center(
        child: Text(
          number,
          style: TextStyle(
              color: ColorManager.myBlue,
              fontWeight: FontWeight.bold,
              fontSize: 18.sp
          ),
        ),
      ),
    );
  }
}
