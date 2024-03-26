import 'dart:convert';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:recipevista/model/recipe/meals_model.dart';

class MealsViewModel extends ChangeNotifier{

  List<Meals> mealsData = <Meals>[];
  List<String> countryList = [
    "Canadian",
    "American",
    "Chinese",
    "Thai",
    "Malaysian",
  ];
  Random random = Random();

  Future<List<Meals>> getMealsData(String url) async{
    try{
      mealsData.clear();
      int randomValue = random.nextInt(5);
      String country = countryList[randomValue];

      var response = await http.get(Uri.parse('$url$country'));
      if(response.statusCode == 200){
        var data = jsonDecode(response.body.toString())['meals'];
        for(var value in data){
          mealsData.add(Meals.fromJson(value));
        }
        return mealsData;
      }
      else{
        debugPrint('error in server');
      }
    }
    catch(error){
      debugPrint(error.toString());
    }
    return mealsData;
  }
}