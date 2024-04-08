import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:recipevista/data/screen.dart';
import 'package:recipevista/resource/color/app_color.dart';
import 'package:recipevista/resource/images/app_images.dart';
import 'package:recipevista/utils/reusable/arrow_icon.dart';
import 'package:recipevista/utils/reusable/favourite_icon.dart';
import 'package:recipevista/view/pages/filter_page.dart';
import 'package:recipevista/view/pages/meal_info_view.dart';
import 'package:recipevista/view_model/recipe/meals_info_view_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  @override
  Widget build(BuildContext context) {
    double height = Screen.screenHeight(context);
    double width = Screen.screenWidth(context);
    final mealsInfoViewModel = Provider.of<MealsInfoViewModel>(context,listen: false);
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const FilterPage()));
                            },
                            child: Image.asset(AppImages.filter,height: height * 0.04,width: height * 0.04)
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.05),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          //height: height * 0.06,
                          width: width * 0.7,
                          child: TextFormField(
                            controller: mealsInfoViewModel.search,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.fastfood),
                              hintText: 'Search by food name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular((width/Screen.designWidth)*30)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular((width/Screen.designWidth)*30)),
                              ),
                              focusColor: Colors.black
                            ),
                          ),
                        ),
                        SizedBox(width: width * 0.02),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: (){
                              mealsInfoViewModel.getSearchMealInfo(context);
                            },
                            child: Material(
                              color: AppColor.secondaryColor,
                              borderRadius: BorderRadius.circular((width/Screen.designWidth)*100),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: width * 0.03,vertical: height * 0.01),
                                  child: Text("Search",
                                    style: GoogleFonts.aBeeZee(
                                      fontSize: (width/Screen.designWidth)*30,
                                      fontWeight : FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Expanded(
                    child: Consumer<MealsInfoViewModel>(
                      builder: (context, mealsInfoValue, child) {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: mealsInfoValue.searchMealData.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap:(){
                                mealsInfoViewModel.getMealInfo(context, mealsInfoValue.searchMealData[index].idMeal.toString()).whenComplete((){
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
                                            image: NetworkImage(mealsInfoValue.searchMealData[index].strMealThumb.toString()),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(top: height * 0.02,right: width * 0.03),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              FavouriteIcon(idMeal: mealsInfoValue.searchMealData[index].idMeal.toString(),),
                                              SizedBox(width: width * 0.05,),
                                              const ArrowIcon(),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Text(mealsInfoValue.searchMealData[index].strMeal.toString(),
                                        style: GoogleFonts.aBeeZee(
                                          fontSize: (width/Screen.designWidth)*30,
                                          fontWeight : FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text('Category: ${mealsInfoValue.searchMealData[index].strCategory.toString()}',
                                        style: GoogleFonts.aBeeZee(
                                          fontSize: (width/Screen.designWidth)*30,
                                          fontWeight : FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text('Area: ${mealsInfoValue.searchMealData[index].strArea.toString()}',
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
          ),
        ],
      ),
    );
  }
}