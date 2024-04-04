import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:recipevista/view/splash_screen.dart';
import 'package:recipevista/view_model/category/categories_view_model.dart';
import 'package:recipevista/view_model/recipe/country_recipe_view_model.dart';
import 'package:recipevista/view_model/recipe/meals_info_view_model.dart';
import 'package:recipevista/view_model/recipe/meals_view_model.dart';
import 'package:recipevista/view_model/recipe/recipe_of_the_day_view_model.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const RecipeVista());
}

class RecipeVista extends StatelessWidget {
  const RecipeVista({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CategoriesViewModel()),
        ChangeNotifierProvider(create: (context) => RecipeOfThedayViewModel()),
        ChangeNotifierProvider(create: (context) => MealsViewModel()),
        ChangeNotifierProvider(create: (context) => MealsInfoViewModel()),
        ChangeNotifierProvider(create: (context) => CountryRecipeViewModel()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}