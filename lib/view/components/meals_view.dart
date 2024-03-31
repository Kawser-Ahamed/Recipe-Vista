import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:recipevista/data/screen.dart';
import 'package:recipevista/resource/color/app_color.dart';
import 'package:recipevista/resource/urls/app_urls.dart';
import 'package:recipevista/utils/reusable/arrow_icon.dart';
import 'package:recipevista/utils/reusable/favourite_icon.dart';
import 'package:recipevista/view/pages/meal_info_view.dart';
import 'package:recipevista/view_model/recipe/meals_info_view_model.dart';
import 'package:recipevista/view_model/recipe/meals_view_model.dart';

class MealsView extends StatefulWidget {
  const MealsView({super.key});

  @override
  State<MealsView> createState() => _MealsViewState();
}

class _MealsViewState extends State<MealsView> {

  AppUrls appUrls = AppUrls();

  @override
  Widget build(BuildContext context) {
    double height = Screen.screenHeight(context);
    double width = Screen.screenWidth(context);
    final mealInfoViewModel = Provider.of<MealsInfoViewModel>(context);
    return FutureBuilder(
      future: Provider.of<MealsViewModel>(context,listen: false).getMealsData(appUrls.justForYou), 
      builder: (context, snapshot) {
        if(snapshot.hasData){
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap:(){
                  mealInfoViewModel.getMealInfo(context, snapshot.data![index].idMeal.toString()).whenComplete((){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const MealInfoView()));
                  });
                },
                child: Card(
                  elevation: 0,
                  color: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular((width/Screen.designWidth)*20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 2,
                          spreadRadius: 2,
                        ),
                      ],
                      image: DecorationImage(
                        image: NetworkImage(snapshot.data![index].strMealThumb.toString()),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Card(
                          color: AppColor.secondaryColor,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: width * 0.02,vertical: height * 0.01),
                            child: Text(snapshot.data![index].strMeal.toString(),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                              style: GoogleFonts.aBeeZee(
                                fontSize: (width/Screen.designWidth)*20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const FavouriteIcon(),
                            SizedBox(width: width * 0.05),
                            const ArrowIcon(),
                          ],
                        ),
                        SizedBox(height: height * 0.01),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
        else{
          return const SizedBox();
        }
      },
    );
  }
}