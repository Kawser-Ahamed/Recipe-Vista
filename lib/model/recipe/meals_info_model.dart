// ignore_for_file: unnecessary_question_mark, prefer_void_to_dynamic

class MealInfoModel {
  List<Meals>? meals;

  MealInfoModel({meals});

  MealInfoModel.fromJson(Map<dynamic, dynamic> json) {
    if (json['meals'] != dynamic) {
      meals = <Meals>[];
      json['meals'].forEach((v) {
        meals!.add( Meals.fromJson(v));
      });
    }
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data =  <dynamic, dynamic>{};
    // ignore: unrelated_type_equality_checks
    if (meals != dynamic) {
      data['meals'] = meals!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Meals {
  dynamic? idMeal;
  dynamic? strMeal;
  dynamic? strDrinkAlternate;
  dynamic? strCategory;
  dynamic? strArea;
  dynamic? strInstructions;
  dynamic? strMealThumb;
  dynamic? strTags;
  dynamic? strYoutube;
  dynamic? dynamicredient1;
  dynamic? dynamicredient2;
  dynamic? dynamicredient3;
  dynamic? dynamicredient4;
  dynamic? dynamicredient5;
  dynamic? dynamicredient6;
  dynamic? dynamicredient7;
  dynamic? dynamicredient8;
  dynamic? dynamicredient9;
  dynamic? dynamicredient10;
  dynamic? dynamicredient11;
  dynamic? dynamicredient12;
  dynamic? dynamicredient13;
  dynamic? dynamicredient14;
  dynamic? dynamicredient15;
  dynamic? dynamicredient16;
  dynamic? dynamicredient17;
  dynamic? dynamicredient18;
  dynamic? dynamicredient19;
  dynamic? dynamicredient20;
  dynamic? strMeasure1;
  dynamic? strMeasure2;
  dynamic? strMeasure3;
  dynamic? strMeasure4;
  dynamic? strMeasure5;
  dynamic? strMeasure6;
  dynamic? strMeasure7;
  dynamic? strMeasure8;
  dynamic? strMeasure9;
  dynamic? strMeasure10;
  dynamic? strMeasure11;
  dynamic? strMeasure12;
  dynamic? strMeasure13;
  dynamic? strMeasure14;
  dynamic? strMeasure15;
  dynamic? strMeasure16;
  dynamic? strMeasure17;
  dynamic? strMeasure18;
  dynamic? strMeasure19;
  dynamic? strMeasure20;
  dynamic? strSource;
  dynamic? strImageSource;
  dynamic? strCreativeCommonsConfirmed;
  dynamic? dateModified;

  Meals(
      {idMeal,
      strMeal,
      strDrinkAlternate,
      strCategory,
      strArea,
      strInstructions,
      strMealThumb,
      strTags,
      strYoutube,
      dynamicredient1,
      dynamicredient2,
      dynamicredient3,
      dynamicredient4,
      dynamicredient5,
      dynamicredient6,
      dynamicredient7,
      dynamicredient8,
      dynamicredient9,
      dynamicredient10,
      dynamicredient11,
      dynamicredient12,
      dynamicredient13,
      dynamicredient14,
      dynamicredient15,
      dynamicredient16,
      dynamicredient17,
      dynamicredient18,
      dynamicredient19,
      dynamicredient20,
      strMeasure1,
      strMeasure2,
      strMeasure3,
      strMeasure4,
      strMeasure5,
      strMeasure6,
      strMeasure7,
      strMeasure8,
      strMeasure9,
      strMeasure10,
      strMeasure11,
      strMeasure12,
      strMeasure13,
      strMeasure14,
      strMeasure15,
      strMeasure16,
      strMeasure17,
      strMeasure18,
      strMeasure19,
      strMeasure20,
      strSource,
      strImageSource,
      strCreativeCommonsConfirmed,
      dateModified});

  Meals.fromJson(Map<dynamic, dynamic> json) {
    idMeal = json['idMeal'];
    strMeal = json['strMeal'];
    strDrinkAlternate = json['strDrinkAlternate'];
    strCategory = json['strCategory'];
    strArea = json['strArea'];
    strInstructions = json['strInstructions'];
    strMealThumb = json['strMealThumb'];
    strTags = json['strTags'];
    strYoutube = json['strYoutube'];
    dynamicredient1 = json['dynamicredient1'];
    dynamicredient2 = json['dynamicredient2'];
    dynamicredient3 = json['dynamicredient3'];
    dynamicredient4 = json['dynamicredient4'];
    dynamicredient5 = json['dynamicredient5'];
    dynamicredient6 = json['dynamicredient6'];
    dynamicredient7 = json['dynamicredient7'];
    dynamicredient8 = json['dynamicredient8'];
    dynamicredient9 = json['dynamicredient9'];
    dynamicredient10 = json['dynamicredient10'];
    dynamicredient11 = json['dynamicredient11'];
    dynamicredient12 = json['dynamicredient12'];
    dynamicredient13 = json['dynamicredient13'];
    dynamicredient14 = json['dynamicredient14'];
    dynamicredient15 = json['dynamicredient15'];
    dynamicredient16 = json['dynamicredient16'];
    dynamicredient17 = json['dynamicredient17'];
    dynamicredient18 = json['dynamicredient18'];
    dynamicredient19 = json['dynamicredient19'];
    dynamicredient20 = json['dynamicredient20'];
    strMeasure1 = json['strMeasure1'];
    strMeasure2 = json['strMeasure2'];
    strMeasure3 = json['strMeasure3'];
    strMeasure4 = json['strMeasure4'];
    strMeasure5 = json['strMeasure5'];
    strMeasure6 = json['strMeasure6'];
    strMeasure7 = json['strMeasure7'];
    strMeasure8 = json['strMeasure8'];
    strMeasure9 = json['strMeasure9'];
    strMeasure10 = json['strMeasure10'];
    strMeasure11 = json['strMeasure11'];
    strMeasure12 = json['strMeasure12'];
    strMeasure13 = json['strMeasure13'];
    strMeasure14 = json['strMeasure14'];
    strMeasure15 = json['strMeasure15'];
    strMeasure16 = json['strMeasure16'];
    strMeasure17 = json['strMeasure17'];
    strMeasure18 = json['strMeasure18'];
    strMeasure19 = json['strMeasure19'];
    strMeasure20 = json['strMeasure20'];
    strSource = json['strSource'];
    strImageSource = json['strImageSource'];
    strCreativeCommonsConfirmed = json['strCreativeCommonsConfirmed'];
    dateModified = json['dateModified'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data =  <dynamic, dynamic>{};
    data['idMeal'] = idMeal;
    data['strMeal'] = strMeal;
    data['strDrinkAlternate'] = strDrinkAlternate;
    data['strCategory'] = strCategory;
    data['strArea'] = strArea;
    data['strInstructions'] = strInstructions;
    data['strMealThumb'] = strMealThumb;
    data['strTags'] = strTags;
    data['strYoutube'] = strYoutube;
    data['dynamicredient1'] = dynamicredient1;
    data['dynamicredient2'] = dynamicredient2;
    data['dynamicredient3'] = dynamicredient3;
    data['dynamicredient4'] = dynamicredient4;
    data['dynamicredient5'] = dynamicredient5;
    data['dynamicredient6'] = dynamicredient6;
    data['dynamicredient7'] = dynamicredient7;
    data['dynamicredient8'] = dynamicredient8;
    data['dynamicredient9'] = dynamicredient9;
    data['dynamicredient10'] = dynamicredient10;
    data['dynamicredient11'] = dynamicredient11;
    data['dynamicredient12'] = dynamicredient12;
    data['dynamicredient13'] = dynamicredient13;
    data['dynamicredient14'] = dynamicredient14;
    data['dynamicredient15'] = dynamicredient15;
    data['dynamicredient16'] = dynamicredient16;
    data['dynamicredient17'] = dynamicredient17;
    data['dynamicredient18'] = dynamicredient18;
    data['dynamicredient19'] = dynamicredient19;
    data['dynamicredient20'] = dynamicredient20;
    data['strMeasure1'] = strMeasure1;
    data['strMeasure2'] = strMeasure2;
    data['strMeasure3'] = strMeasure3;
    data['strMeasure4'] = strMeasure4;
    data['strMeasure5'] = strMeasure5;
    data['strMeasure6'] = strMeasure6;
    data['strMeasure7'] = strMeasure7;
    data['strMeasure8'] = strMeasure8;
    data['strMeasure9'] = strMeasure9;
    data['strMeasure10'] = strMeasure10;
    data['strMeasure11'] = strMeasure11;
    data['strMeasure12'] = strMeasure12;
    data['strMeasure13'] = strMeasure13;
    data['strMeasure14'] = strMeasure14;
    data['strMeasure15'] = strMeasure15;
    data['strMeasure16'] = strMeasure16;
    data['strMeasure17'] = strMeasure17;
    data['strMeasure18'] = strMeasure18;
    data['strMeasure19'] = strMeasure19;
    data['strMeasure20'] = strMeasure20;
    data['strSource'] = strSource;
    data['strImageSource'] = strImageSource;
    data['strCreativeCommonsConfirmed'] = strCreativeCommonsConfirmed;
    data['dateModified'] = dateModified;
    return data;
  }
}
