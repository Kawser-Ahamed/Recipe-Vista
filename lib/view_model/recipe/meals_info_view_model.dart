// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:recipevista/model/recipe/meals_info_model.dart';
import 'package:recipevista/resource/color/app_color.dart';
import 'package:recipevista/resource/urls/app_urls.dart';
import 'package:http/http.dart' as http;

class MealsInfoViewModel extends ChangeNotifier{
  
  AppUrls appUrls = AppUrls();
  TextEditingController search = TextEditingController();
  List<Meals> searchMealData = <Meals>[];
  List<Meals> filterMealData = <Meals>[];

  Future<List<Meals>> getSearchMealInfo(BuildContext context) async{
    try{
      showDialog(
        context: context, 
        builder: (context) {
          return SpinKitFadingCube(
            itemBuilder: (context, index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: (index%2==0)? AppColor.primaryColor : AppColor.secondaryColor,
                )
              );
            },
          );
        },
      );
      searchMealData.clear();
      var response = await http.get(Uri.parse('${appUrls.searchUrl}${search.text}'));
      if(response.statusCode == 200){
        var data = jsonDecode(response.body.toString())['meals'];
        for(var values in data){
          searchMealData.add(Meals.fromJson(values));
        }
        notifyListeners();
        Navigator.pop(context);
        return searchMealData;
      }
      else{
        Navigator.pop(context);
        debugPrint('Server Error');
      }
    }
    catch(error){
      Navigator.pop(context);
      debugPrint('error: ${error.toString()}');
    }
    Navigator.pop(context);
    return searchMealData;
  }

  Future<List<Meals>> getFilterByChracter(BuildContext context,String charcater) async{
    try{
      showDialog(
        context: context, 
        builder: (context) {
          return SpinKitFadingCube(
            itemBuilder: (context, index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: (index%2==0)? AppColor.primaryColor : AppColor.secondaryColor,
                )
              );
            },
          );
        },
      );
      filterMealData.clear();
      var response = await http.get(Uri.parse('${appUrls.filterByCharacter}$charcater'));
      if(response.statusCode == 200){
        var data = jsonDecode(response.body.toString())['meals'];
        for(var values in data){
          filterMealData.add(Meals.fromJson(values));
        }
        notifyListeners();
        Navigator.pop(context);
        return filterMealData;
      }
      else{
        Navigator.pop(context);
        debugPrint('Server Error');
      }
    }
    catch(error){
      filterMealData.clear();
      debugPrint('error: ${error.toString()}');
    }
    Navigator.pop(context);
    return filterMealData;
  }
}