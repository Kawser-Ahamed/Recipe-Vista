// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:recipevista/model/recipe/meals_model.dart';
import 'package:http/http.dart' as http;
import 'package:recipevista/resource/color/app_color.dart';
import 'package:recipevista/resource/urls/app_urls.dart';

class CategoriesRecipeViewModel extends ChangeNotifier{

  List<Meals> categoriesRecipeData = <Meals>[];
  String? categoriesName;
  AppUrls appUrls = AppUrls();

  Future<List<Meals>> getCategoriesRecipe(BuildContext context) async{
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
    categoriesRecipeData.clear();
    try{
      var response = await http.get(Uri.parse('${appUrls.categoriesRecipe}$categoriesName'));
      if(response.statusCode == 200){
        var data = jsonDecode(response.body.toString())['meals'];
        for(var values in data){
          categoriesRecipeData.add(Meals.fromJson(values));
        }
        notifyListeners();
      }
      else{
        debugPrint('Server Response Failed');
      }
    }
    catch(error){
      debugPrint(error.toString());
    }
    Navigator.pop(context);
    return categoriesRecipeData;
  }
}