import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:recipevista/model/category/categories_model.dart';
import 'package:http/http.dart' as http;
import 'package:recipevista/resource/urls/app_urls.dart';

class CategoriesViewModel extends ChangeNotifier{

  List<Categories> categoriesdata = <Categories>[];
  AppUrls appUrls = AppUrls();

  Future<List<Categories>> getCategories() async{
    try{
      var response = await http.get(Uri.parse(appUrls.categoryApi));
      if(response.statusCode==200){
        var data = jsonDecode(response.body.toString())['categories'];
        for(var values in data){
          categoriesdata.add(Categories.fromJson(values));
        }
        notifyListeners();
        return categoriesdata;
      }
    }
    catch(error){
      debugPrint(error.toString());
    }
    return categoriesdata;
  }
}