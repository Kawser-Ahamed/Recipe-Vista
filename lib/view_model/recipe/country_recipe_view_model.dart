// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:recipevista/model/recipe/meals_model.dart';
import 'package:http/http.dart' as http;
import 'package:recipevista/resource/color/app_color.dart';
import 'package:recipevista/resource/urls/app_urls.dart';

class CountryRecipeViewModel extends ChangeNotifier{

  List<Meals> countryRecipeData = <Meals>[];
  String countryName='';
  AppUrls appUrls = AppUrls();

  Future<List<Meals>> getCountryRecipe(BuildContext context) async{
    showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (context) {
        return Center(
          child: SpinKitFadingCube(
            itemBuilder: (context, index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: (index%2==0)? AppColor.primaryColor : AppColor.secondaryColor,
                )
              );
            },
          )
        );
      },
    );
    try{
      countryRecipeData.clear();
      var response = await http.get(Uri.parse('${appUrls.countryRecipeUrl}$countryName'));
      if(response.statusCode == 200){
        var data = jsonDecode(response.body.toString())['meals'];
        for(var values in data){
          countryRecipeData.add(Meals.fromJson(values));
        }
        notifyListeners();
        Navigator.pop(context);
        return countryRecipeData;
      }
      else{
        debugPrint('Server Connection Failed');
      }
    }
    catch(error){
      debugPrint('Country Recipe Error: ${error.toString()}');
    }
    Navigator.pop(context);
    return countryRecipeData;
  }
}