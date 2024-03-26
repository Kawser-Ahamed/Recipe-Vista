import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:recipevista/model/recipe/recipe_of_the_day_model.dart';
import 'package:recipevista/resource/urls/app_urls.dart';
import 'package:http/http.dart' as http;

class RecipeOfThedayViewModel extends ChangeNotifier{

  List<Meals> randomRecipeData = <Meals>[];
  AppUrls appUrls = AppUrls();

  Future<List<Meals>> getRandomRecipe(BuildContext context) async{
    try{
      var response = await http.get(Uri.parse(appUrls.recipeOfTheDayUrl));
      if(response.statusCode==200){
        var data = jsonDecode(response.body.toString())['meals'];
        for(var values in data){
          randomRecipeData.add(Meals.fromJson(values));
        }
        notifyListeners();
        return randomRecipeData;
      }
      else{
        debugPrint('error in server');
      }
    }
    catch(error){
      debugPrint(error.toString());
      showDialog(
        // ignore: use_build_context_synchronously
        context: context, 
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text(error.toString()),
          );
        },
      );
    }
    return randomRecipeData;
  }
}