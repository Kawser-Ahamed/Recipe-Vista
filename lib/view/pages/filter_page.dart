import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:recipevista/data/alphabet.dart';
import 'package:recipevista/data/screen.dart';
import 'package:recipevista/resource/color/app_color.dart';
import 'package:recipevista/resource/images/app_images.dart';
import 'package:recipevista/utils/reusable/arrow_icon.dart';
import 'package:recipevista/utils/reusable/favourite_icon.dart';
import 'package:recipevista/view/pages/meal_info_view.dart';
import 'package:recipevista/view/pages/searh_page.dart';
import 'package:recipevista/view_model/recipe/meals_info_view_model.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {

  Alphabet alphabet = Alphabet();
  
  @override
  Widget build(BuildContext context) {
    double height = Screen.screenHeight(context);
    double width = Screen.screenWidth(context);
    final mealInfoValue = Provider.of<MealsInfoViewModel>(context,listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: height,
              width: width,
              color: Colors.transparent,
              child: Column(
                children: [
                  Container(
                    height: height * 0.1,
                    width: width * 1,
                    color: Colors.transparent,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap:(){
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_back_ios,size: (width/Screen.designWidth)*50)
                          ),
                          Text("RecipeVista",
                            style: GoogleFonts.aBeeZee(
                              fontSize: (width/Screen.designWidth)*40,
                              fontWeight : FontWeight.bold,
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchPage()));
                            },
                            child: Icon(Icons.search,size: (width/Screen.designWidth)*50),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  ExpansionTile(
                    title: Text("Filter By First Character",
                      style: TextStyle(
                        fontSize: (width/Screen.designWidth) * 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    leading: Image.asset(AppImages.filter,height: height * 0.03),
                    children: [
                      GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 6,
                          childAspectRatio: ((width)/height / 0.3),
                          crossAxisSpacing: width * 0.02,
                          mainAxisSpacing: height * 0.01,
                        ), 
                        itemCount: alphabet.alphabets.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: (){
                              mealInfoValue.getFilterByChracter(context, alphabet.alphabets[index]);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                  ),
                                ]
                              ),
                              child: Text(alphabet.alphabets[index],
                                style: TextStyle(
                                  fontSize: (width/Screen.designWidth) * 30,
                                  color: AppColor.secondaryColor,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: height * 0.02),
                    ],
                  ),
                  Expanded(
                    child: Consumer<MealsInfoViewModel>(
                      builder: (context, mealsInfoValue, child) {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: mealsInfoValue.filterMealData.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap:(){
                                mealInfoValue.getMealInfo(context, mealInfoValue.filterMealData[index].idMeal.toString()).whenComplete((){
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
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular((width/Screen.designWidth)*20),
                                            topRight: Radius.circular((width/Screen.designWidth)*20)
                                          ),
                                          image: DecorationImage(
                                            image: NetworkImage(mealsInfoValue.filterMealData[index].strMealThumb.toString()),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(top: height * 0.02,right: width * 0.03),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              FavouriteIcon(idMeal:mealsInfoValue.filterMealData[index].idMeal.toString()),
                                              SizedBox(width: width * 0.05,),
                                              const ArrowIcon()
                                            ],
                                          ),
                                        ),
                                      ),
                                      Text(mealsInfoValue.filterMealData[index].strMeal.toString(),
                                        style: GoogleFonts.aBeeZee(
                                          fontSize: (width/Screen.designWidth)*30,
                                          fontWeight : FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text('Category: ${mealsInfoValue.filterMealData[index].strCategory.toString()}',
                                        style: GoogleFonts.aBeeZee(
                                          fontSize: (width/Screen.designWidth)*30,
                                          fontWeight : FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text('Area: ${mealsInfoValue.filterMealData[index].strArea.toString()}',
                                        style: GoogleFonts.aBeeZee(
                                          fontSize: (width/Screen.designWidth)*30,
                                          fontWeight : FontWeight.normal,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}