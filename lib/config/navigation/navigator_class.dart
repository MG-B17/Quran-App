import 'package:flutter/material.dart';

abstract class NavigatorClass {
 void navigation ({required context,required Widget screen});
}

class PushNavigation extends NavigatorClass{
  @override
  void navigation({required context, required Widget screen}) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>screen));
  }

}