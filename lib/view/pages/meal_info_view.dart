import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:recipevista/data/screen.dart';
import 'package:recipevista/model/recipe/meals_info_model.dart';
import 'package:recipevista/resource/color/app_color.dart';
import 'package:recipevista/resource/images/app_images.dart';
import 'package:recipevista/view_model/recipe/meals_info_view_model.dart';

class MealInfoView extends StatefulWidget {
  const MealInfoView({super.key});

  @override
  State<MealInfoView> createState() => _MealInfoViewState();
}

class _MealInfoViewState extends State<MealInfoView> with TickerProviderStateMixin{
  
  @override
  Widget build(BuildContext context) {
    double height = Screen.screenHeight(context);
    double width = Screen.screenWidth(context);
    final mealInfoViewModel = Provider.of<MealsInfoViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: height,
        width: width,
        color: Colors.transparent,
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(mealInfoViewModel.mealInfoData.first.strMealThumb,fit: BoxFit.fitWidth),
                Positioned(
                  top: height * 0.05,
                  left: width * 0.05,
                  right: width * 0.05,
                  bottom: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap:(){
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: height * 0.05,
                          width: height * 0.05,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade500,
                                blurRadius: 2,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: FittedBox(
                            child: Padding(
                              padding: EdgeInsets.all(width * 0.01),
                              child: Icon(Icons.arrow_back,size: (width/Screen.designWidth)*60,color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: height * 0.05,
                        width: height * 0.05,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade500,
                              blurRadius: 2,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: FittedBox(
                          child: Padding(
                            padding: EdgeInsets.all(width * 0.01),
                            child: Icon(Icons.favorite_outline,size: (width/Screen.designWidth)*60,color: Colors.pink),
                          ),
                        ),
                      ),
                    ],
                  )
                ),
              ],
            ),
            Expanded(
              child: Container(
                color: Colors.transparent,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(mealInfoViewModel.mealInfoData.first.strMeal,
                              style: GoogleFonts.aBeeZee(
                                fontSize: (width/Screen.designWidth)*40,
                                fontWeight : FontWeight.bold,
                              ),
                            ),
                            Text('Category: ${mealInfoViewModel.mealInfoData.first.strCategory}',
                              style: GoogleFonts.aBeeZee(
                                fontSize: (width/Screen.designWidth)*30,
                                fontWeight : FontWeight.normal,
                              ),
                            ),
                            Text('Country: ${mealInfoViewModel.mealInfoData.first.strArea}',
                              style: GoogleFonts.aBeeZee(
                                fontSize: (width/Screen.designWidth)*30,
                                fontWeight : FontWeight.normal,
                              ),
                            ),
                            Row(
                              children: [
                                Text('Youtube Tutorial : ',
                                  style: TextStyle(
                                    fontSize: (width/Screen.designWidth)*30,
                                    fontWeight : FontWeight.normal,
                                  ),
                                ),
                                SizedBox(width: width * 0.03),
                                Image.asset(AppImages.youtubeLogo,height: height * 0.05,width: width * 0.1),
                              ],
                            ),
                            SizedBox(height: height * 0.01),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text("Ingredieants",
                                    style: GoogleFonts.aBeeZee(
                                      fontSize: (width/Screen.designWidth) * 30,
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.primaryColor,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text("Measurements",
                                    style: GoogleFonts.aBeeZee(
                                      fontSize: (width/Screen.designWidth) * 30,
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.primaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: 19,
                                    itemBuilder: (context, index) {
                                      Meals meal = mealInfoViewModel.mealInfoData.first;
                                      return (meal['strIngredient${index+1}'].toString().isNotEmpty && meal['strIngredient${index+1}'] != null) 
                                      ? Row(
                                        children: [
                                          Icon(Icons.circle,color: AppColor.secondaryColor,size: (width/Screen.designWidth)*20),
                                          SizedBox(width: width * 0.03),
                                          Expanded(
                                            child: Text(meal['strIngredient${index+1}'],
                                              style: TextStyle(
                                                fontSize: (width/Screen.designWidth) * 30,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ) : const SizedBox();
                                    },
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: 19,
                                    itemBuilder: (context, index) {
                                      Meals meal = mealInfoViewModel.mealInfoData.first;
                                      return (meal['strIngredient${index+1}'].toString().isNotEmpty && meal['strIngredient${index+1}'] != null) ? Row(
                                        children: [
                                          Icon(Icons.circle,color: AppColor.secondaryColor,size: (width/Screen.designWidth)*20),
                                          SizedBox(width: width * 0.03),
                                          Expanded(
                                            child: Text(meal['strMeasure${index+1}'],
                                              style: TextStyle(
                                                fontSize: (width/Screen.designWidth) * 30,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ) : const SizedBox();
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: height * 0.02),
                            Text("Instruction",
                              style: GoogleFonts.aBeeZee(
                                fontSize: (width/Screen.designWidth) * 35,
                                color: AppColor.primaryColor,
                                fontWeight:FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: height * 0.02),
                            Padding(
                              padding: EdgeInsets.only(right: width * 0.03),
                              child: ExpandableText(
                                mealInfoViewModel.mealInfoData.first.strInstructions,
                                maxLines: 5,
                                expandText: 'Read More',
                                collapseText: 'Read Less',
                                linkColor: AppColor.secondaryColor,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: (width/Screen.designWidth) * 30,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(height: height * 0.02),
                            Center(
                              child: Text("Now, Let's Start Cooking...!!!",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.aBeeZee(
                                  fontSize: (width/Screen.designWidth) * 35,
                                  color: Colors.black,
                                  fontWeight:FontWeight.normal,
                                ),
                              ),
                            ),
                            SizedBox(height: height * 0.02),
                          ],
                        ),
                      )
                    ],
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}