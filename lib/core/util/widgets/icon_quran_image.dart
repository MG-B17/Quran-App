import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconQuranImage extends StatelessWidget {
  const IconQuranImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image(
      image:const AssetImage("assets/images/icon.png"),
      width: 350.w,
      height: 180.h,
    );
  }
}
