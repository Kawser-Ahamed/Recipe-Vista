// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Screen{

  static double designHeight = 375;
  static double designWidth = 667;

  static double screenHeight(BuildContext context){
    return MediaQuery.of(context).size.height;
  }
  static double screenWidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }
}