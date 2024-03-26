import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipevista/data/Screen.dart';
import 'package:recipevista/utils/reusable/arrow_icon.dart';
import 'package:recipevista/utils/reusable/favourite_icon.dart';
import 'package:recipevista/view_model/recipe/recipe_of_the_day_view_model.dart';

class RecipeOfTheDay extends StatelessWidget {
  const RecipeOfTheDay({super.key});

  @override
  Widget build(BuildContext context) {
    double height = Screen.screenHeight(context);
    double width = Screen.screenWidth(context);
    return Consumer<RecipeOfThedayViewModel>(
      builder: (context, recipeOfThedayViewModel, child) {
        return Card(
          elevation: 0,
          color: Colors.transparent,
          child: Container(
            width: width * 1,
            margin: EdgeInsets.only(right: width *0.03),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular((width/Screen.designWidth)*20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: height * 0.25,
                  width: width * 1,
                  alignment: Alignment.topRight,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular((width/Screen.designWidth)*20),
                    image: DecorationImage(
                      image: NetworkImage(recipeOfThedayViewModel.randomRecipeData.first.strMealThumb.toString()),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.03,vertical: height * 0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const FavouriteIcon(),
                        SizedBox(width: width * 0.03),
                        const ArrowIcon(),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: width * 0.02),
                Text(recipeOfThedayViewModel.randomRecipeData.first.strMeal.toString(),
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: (width/Screen.designWidth)*35,
                    fontWeight: FontWeight.w600,

                  ),
                ),
                Text('Category: ${recipeOfThedayViewModel.randomRecipeData.first.strCategory.toString()}',
                  style: TextStyle(
                    fontSize: (width/Screen.designWidth)*30,
                    fontWeight: FontWeight.normal,

                  ),
                ),
                Text('Country: ${recipeOfThedayViewModel.randomRecipeData.first.strArea.toString()}',
                  style: TextStyle(
                    fontSize: (width/Screen.designWidth)*30,
                    fontWeight: FontWeight.normal,

                  ),
                ),
                //SizedBox(height: height * 0.01),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     const FavouriteIcon(),
                //     SizedBox(width: width * 0.1),
                //     const ArrowIcon(),
                //   ],
                // ),
                // SizedBox(height: height * 0.01),
              ],
            ),
          ),
        );
      },
    );
  }
}