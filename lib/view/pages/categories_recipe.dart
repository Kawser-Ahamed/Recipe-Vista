import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:recipevista/data/screen.dart';
import 'package:recipevista/resource/color/app_color.dart';
import 'package:recipevista/utils/reusable/arrow_icon.dart';
import 'package:recipevista/utils/reusable/favourite_icon.dart';
import 'package:recipevista/view/pages/meal_info_view.dart';
import 'package:recipevista/view/pages/searh_page.dart';
import 'package:recipevista/view_model/recipe/categories_recipe_view_model.dart';
import 'package:recipevista/view_model/recipe/meals_info_view_model.dart';

class CategoriesRecipe extends StatefulWidget {
  const CategoriesRecipe({super.key});

  @override
  State<CategoriesRecipe> createState() => _CategoriesRecipeState();
}

class _CategoriesRecipeState extends State<CategoriesRecipe> {
  @override
  Widget build(BuildContext context) {
    double height = Screen.screenHeight(context);
    double width = Screen.screenWidth(context);
    final categoriesRecipeViewModel = Provider.of<CategoriesRecipeViewModel>(context,listen: false);
    final mealInfoViewModel = Provider.of<MealsInfoViewModel>(context,listen: false);
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        color: AppColor.backgroundColor,
        child: Column(
          children: [
            Container(
              height: height * 0.1,
              width: width * 1,
              color: Colors.transparent,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap:(){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back,size: (width/Screen.designWidth)*50,color: Colors.black)
                    ),
                    Text(categoriesRecipeViewModel.categoriesName.toString(),
                      style: GoogleFonts.aBeeZee(
                        fontSize: (width/Screen.designWidth) * 35,
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchPage()));
                      },
                      child: Icon(Icons.search,size: (width/Screen.designWidth)*50,color: Colors.black)
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: categoriesRecipeViewModel.categoriesRecipeData.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      mealInfoViewModel.getMealInfo(context,categoriesRecipeViewModel.categoriesRecipeData[index].idMeal.toString()).whenComplete((){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const MealInfoView()));
                      });
                    },
                    child: Card(
                      elevation: 0,
                      color: Colors.transparent,
                      child: Container(
                        margin: EdgeInsets.only(bottom: height * 0.02,left: width * 0.02,right: width * 0.02),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular((width/Screen.designWidth)*20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400,
                              spreadRadius: 2,
                              blurRadius: 2,
                            )
                          ]
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: height * 0.25,
                              width: width * 1,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.all(Radius.circular((width/Screen.designWidth)*20)),
                                image: DecorationImage(
                                  image: NetworkImage(categoriesRecipeViewModel.categoriesRecipeData[index].strMealThumb.toString()),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(top: height * 0.02,right: width * 0.03,bottom: height * 0.02),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        FavouriteIcon(idMeal: categoriesRecipeViewModel.categoriesRecipeData[index].idMeal.toString(),),
                                        SizedBox(width: width * 0.05,),
                                        const ArrowIcon()
                                      ],
                                    ),
                                    Material(
                                      color: AppColor.secondaryColor,
                                      borderRadius: BorderRadius.circular((width/Screen.designWidth)*50),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: width * 0.03,vertical: height * 0.005),
                                        child: Text(categoriesRecipeViewModel.categoriesRecipeData[index].strMeal.toString(),
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.aBeeZee(
                                            fontSize: (width/Screen.designWidth)*30,
                                            fontWeight : FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ),
                            ),                          
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            ),
          ],
        ),
      ),
    );
  }
}