import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:recipevista/model/recipe/meals_model.dart';
import 'package:recipevista/resource/color/app_color.dart';
import 'package:sqflite/sqflite.dart';

class SqliteDatabase extends ChangeNotifier{

    late Database db;
    List<Meals> myFavouriteData = <Meals>[];
    Map<String,bool> myFavouriteDataMap = <String,bool>{};

   Future<void> initializedDatabase() async{
    try{
      Directory directory = await getApplicationCacheDirectory();
      String path = '${directory.path}RecipeVista.db';
      db = await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async{
          await db.execute('CREATE TABLE Favourite (idMeal TEXT PRIMARY KEY, strMeal TEXT, strMealThumb TEXT)');
        },
      );
    }
    catch(error){
      debugPrint('Database Initialize Error: ${error.toString()}');
    }
  }

   void makeJson(String idMeal,String strMeal,String strMealThumb,BuildContext context){
    final meals = Meals(idMeal: idMeal,strMeal: strMeal,strMealThumb: strMealThumb);
    insertFavouriteData(meals,context);
  }

   Future<void> insertFavouriteData(Meals meals,BuildContext context) async{
    if(meals.strMealThumb == null || meals.strMealThumb!.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: const Text("Please try again"),backgroundColor: AppColor.primaryColor,showCloseIcon: true,closeIconColor: AppColor.secondaryColor));
    }
    else{
      try{
        await db.insert('Favourite', meals.toJson());
        myFavouriteDataMap[meals.idMeal.toString()] = true;
        notifyListeners();
        debugPrint('Data Inserted Successfull');
      }
      catch(error){
        debugPrint('Sqlite Data Insert Error: ${error.toString()}');
      }
    }
  }

   Future<List<Meals>> getMyFavouriteData() async{
    myFavouriteData.clear();
    try{
      var result = await db.query('Favourite');
      for(var values in result){
        myFavouriteData.add(Meals.fromJson(values));
      }
      for(int i=0;i<myFavouriteData.length;i++){
        myFavouriteDataMap[myFavouriteData[i].idMeal.toString()] = true;
      }
      notifyListeners();
    }
    catch(error){
      debugPrint('Error While Fetch Sqlite Data ${error.toString()}');
    }
    return myFavouriteData;
  }

   Future<void> deleteMyFavourite(String idMeal) async{
    try{
      await db.delete('Favourite',where: 'idMeal=?',whereArgs: [idMeal]);
      myFavouriteDataMap.remove(idMeal);
      getMyFavouriteData();
      notifyListeners();
      debugPrint('Sqlite Data Delete Successfull');
    }
    catch(error){
      debugPrint(error.toString());
    }
  }
}