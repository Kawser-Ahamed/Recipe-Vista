import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:recipevista/data/screen.dart';
import 'package:recipevista/resource/color/app_color.dart';
import 'package:recipevista/utils/reusable/arrow_icon.dart';
import 'package:recipevista/utils/reusable/favourite_icon.dart';
import 'package:recipevista/view/pages/meal_info_view.dart';
import 'package:recipevista/view/pages/searh_page.dart';
import 'package:recipevista/view_model/recipe/country_recipe_view_model.dart';
import 'package:recipevista/view_model/recipe/meals_info_view_model.dart';

class CountryRecipeView extends StatefulWidget {
  const CountryRecipeView({super.key});

  @override
  State<CountryRecipeView> createState() => _CountryRecipeViewState();
}

class _CountryRecipeViewState extends State<CountryRecipeView> {
  @override
  Widget build(BuildContext context) {
    double height = Screen.screenHeight(context);
    double width = Screen.screenWidth(context);
    final countryRecipeViewModel = Provider.of<CountryRecipeViewModel>(context);
    final mealsInfoViewModel = Provider.of<MealsInfoViewModel>(context);
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
                    Text(countryRecipeViewModel.countryName,
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
                itemCount: countryRecipeViewModel.countryRecipeData.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      mealsInfoViewModel.getMealInfo(context,countryRecipeViewModel.countryRecipeData[index].idMeal.toString()).whenComplete((){
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
                                  image: NetworkImage(countryRecipeViewModel.countryRecipeData[index].strMealThumb.toString()),
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
                                        const FavouriteIcon(),
                                        SizedBox(width: width * 0.05,),
                                        const ArrowIcon()
                                      ],
                                    ),
                                    Material(
                                      color: AppColor.secondaryColor,
                                      borderRadius: BorderRadius.circular((width/Screen.designWidth)*50),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: width * 0.03,vertical: height * 0.005),
                                        child: Text(countryRecipeViewModel.countryRecipeData[index].strMeal.toString(),
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
      )
    );
  }
}