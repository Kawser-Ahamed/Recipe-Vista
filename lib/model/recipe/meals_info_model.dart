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
  dynamic? strIngredient1;
  dynamic? strIngredient2;
  dynamic? strIngredient3;
  dynamic? strIngredient4;
  dynamic? strIngredient5;
  dynamic? strIngredient6;
  dynamic? strIngredient7;
  dynamic? strIngredient8;
  dynamic? strIngredient9;
  dynamic? strIngredient10;
  dynamic? strIngredient11;
  dynamic? strIngredient12;
  dynamic? strIngredient13;
  dynamic? strIngredient14;
  dynamic? strIngredient15;
  dynamic? strIngredient16;
  dynamic? strIngredient17;
  dynamic? strIngredient18;
  dynamic? strIngredient19;
  dynamic? strIngredient20;
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
      strIngredient1,
      strIngredient2,
      strIngredient3,
      strIngredient4,
      strIngredient5,
      strIngredient6,
      strIngredient7,
      strIngredient8,
      strIngredient9,
      strIngredient10,
      strIngredient11,
      strIngredient12,
      strIngredient13,
      strIngredient14,
      strIngredient15,
      strIngredient16,
      strIngredient17,
      strIngredient18,
      strIngredient19,
      strIngredient20,
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
    strIngredient1 = json['strIngredient1'];
    strIngredient2 = json['strIngredient2'];
    strIngredient3 = json['strIngredient3'];
    strIngredient4 = json['strIngredient4'];
    strIngredient5 = json['strIngredient5'];
    strIngredient6 = json['strIngredient6'];
    strIngredient7 = json['strIngredient7'];
    strIngredient8 = json['strIngredient8'];
    strIngredient9 = json['strIngredient9'];
    strIngredient10 = json['strIngredient10'];
    strIngredient11 = json['strIngredient11'];
    strIngredient12 = json['strIngredient12'];
    strIngredient13 = json['strIngredient13'];
    strIngredient14 = json['strIngredient14'];
    strIngredient15 = json['strIngredient15'];
    strIngredient16 = json['strIngredient16'];
    strIngredient17 = json['strIngredient17'];
    strIngredient18 = json['strIngredient18'];
    strIngredient19 = json['strIngredient19'];
    strIngredient20 = json['strIngredient20'];
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['idMeal'] = idMeal;
    data['strMeal'] = strMeal;
    data['strDrinkAlternate'] = strDrinkAlternate;
    data['strCategory'] = strCategory;
    data['strArea'] = strArea;
    data['strInstructions'] = strInstructions;
    data['strMealThumb'] = strMealThumb;
    data['strTags'] = strTags;
    data['strYoutube'] = strYoutube;
    data['strIngredient1'] = strIngredient1;
    data['strIngredient2'] = strIngredient2;
    data['strIngredient3'] = strIngredient3;
    data['strIngredient4'] = strIngredient4;
    data['strIngredient5'] = strIngredient5;
    data['strIngredient6'] = strIngredient6;
    data['strIngredient7'] = strIngredient7;
    data['strIngredient8'] = strIngredient8;
    data['strIngredient9'] = strIngredient9;
    data['strIngredient10'] = strIngredient10;
    data['strIngredient11'] = strIngredient11;
    data['strIngredient12'] = strIngredient12;
    data['strIngredient13'] = strIngredient13;
    data['strIngredient14'] = strIngredient14;
    data['strIngredient15'] = strIngredient15;
    data['strIngredient16'] = strIngredient16;
    data['strIngredient17'] = strIngredient17;
    data['strIngredient18'] = strIngredient18;
    data['strIngredient19'] = strIngredient19;
    data['strIngredient20'] = strIngredient20;
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

  dynamic operator [] ( String key){
    switch(key){
      case 'strIngredient1':
        return strIngredient1;
      case 'strIngredient2':
        return strIngredient2;
      case 'strIngredient3':
        return strIngredient3;
      case 'strIngredient4':
        return strIngredient4;
      case 'strIngredient5':
        return strIngredient5;
      case 'strIngredient6':
        return strIngredient6;
      case 'strIngredient7':
        return strIngredient7;
      case 'strIngredient8':
        return strIngredient8;
      case 'strIngredient9':
        return strIngredient9;
      case 'strIngredient10':
        return strIngredient10;
      case 'strIngredient11':
        return strIngredient11;
      case 'strIngredient12':
        return strIngredient12;
      case 'strIngredient13':
        return strIngredient13;
      case 'strIngredient14':
        return strIngredient14;
      case 'strIngredient15':
        return strIngredient15;
      case 'strIngredient16':
        return strIngredient16;
      case 'strIngredient17':
        return strIngredient17;
      case 'strIngredient18':
        return strIngredient18;
      case 'strIngredient19':
        return strIngredient19;
      case 'strIngredient20':
        return strIngredient20;
      case 'strMeasure1':
        return strMeasure1;
      case 'strMeasure2':
        return strMeasure2;
      case 'strMeasure3':
        return strMeasure3;
      case 'strMeasure4':
        return strMeasure4;
      case 'strMeasure5':
        return strMeasure5;
      case 'strMeasure6':
        return strMeasure6;
      case 'strMeasure7':
        return strMeasure7;
      case 'strMeasure8':
        return strMeasure8;
      case 'strMeasure9':
        return strMeasure9;
      case 'strMeasure10':
        return strMeasure10;
      case 'strMeasure11':
        return strMeasure11;
      case 'strMeasure12':
        return strMeasure12;
      case 'strMeasure13':
        return strMeasure13;
      case 'strMeasure14':
        return strMeasure14;
      case 'strMeasure15':
        return strMeasure15;
      case 'strMeasure16':
        return strMeasure16;
      case 'strMeasure17':
        return strMeasure17;
      case 'strMeasure18':
        return strMeasure18;
      case 'strMeasure19':
        return strMeasure19;
      case 'strMeasure20':
        return strMeasure20;
      default:
        return null;
    }
  }
}
