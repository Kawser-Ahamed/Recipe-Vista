import 'package:flutter/material.dart';
import 'package:recipevista/resource/images/app_images.dart';

class CountryData{
  static List<Map<String,dynamic>> countryData = [
    {
      "name" : "Canadian",
      "imageUrl" : AppImages.canada,
      "color" : Colors.blue.withOpacity(0.2),
    },
    {
      "name" : "American",
      "imageUrl" : AppImages.america,
      "color" : Colors.pink.withOpacity(0.2),
    },
    {
      "name" : "Chinese",
      "imageUrl" : AppImages.chinese,
      "color" : Colors.green.withOpacity(0.2),
    },
    {
      "name" : "Thai",
      "imageUrl" : AppImages.thailand,
      "color" : Colors.deepPurple.withOpacity(0.2),
    },
    {
      "name" : "Malaysian",
      "imageUrl" : AppImages.malaysia,
      "color" : Colors.deepOrange.withOpacity(0.2),
    },
  ];
}