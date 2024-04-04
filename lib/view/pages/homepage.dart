import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipevista/data/Screen.dart';
import 'package:recipevista/resource/color/app_color.dart';
import 'package:recipevista/resource/images/app_images.dart';
import 'package:recipevista/view/components/category.dart';
import 'package:recipevista/view/components/country.dart';
import 'package:recipevista/view/components/meals_view.dart';
import 'package:recipevista/view/components/recipe_of_the_day.dart';
import 'package:recipevista/view/pages/filter_page.dart';
import 'package:recipevista/view/pages/searh_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  
  late final AnimationController controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  )..forward();

  late final Animation<double> animation = CurvedAnimation(
    parent: controller, 
    curve: Curves.easeOut,
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double height = Screen.screenHeight(context);
    double width = Screen.screenWidth(context);
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: FadeTransition(
          opacity: animation,
          child: Container(
            height: height * 1,
            width: width * 1,
            color: Colors.transparent,
            margin: EdgeInsets.only(left: width * 0.03),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height * 0.05),
                      Text("RecipeVista",
                        style: GoogleFonts.aBeeZee(
                          fontSize: (width/Screen.designWidth) * 40,
                          fontWeight : FontWeight.bold,
                          color: AppColor.primaryColor,
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      const Country(),
                      Text("What Would you Like 2 Cook",
                        style: GoogleFonts.aBeeZee(
                          fontSize: (width/Screen.designWidth)*50,
                          color: Colors.black,
                          fontWeight : FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: height * 0.01),
                      InkWell(
                        onTap:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchPage()));
                        },
                        child: Card(
                          color: Colors.transparent,
                          elevation: 0,
                          child: Container(
                            margin: EdgeInsets.only(right: width * 0.03),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular((width/Screen.designWidth)*100),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade300,
                                  blurRadius: 2,
                                  spreadRadius: 2,
                                )
                              ]
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: width * 0.03,vertical: height * 0.015),
                              child: Row(
                                children: [
                                  Icon(Icons.search,size: (width/Screen.designWidth)*50,color: Colors.black),
                                  SizedBox(width: width * 0.03),
                                  Expanded(
                                    flex: 2,
                                    child: Text("Search for your query",
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.aBeeZee(
                                        fontSize: (width/Screen.designWidth)*30,
                                        color: Colors.black,
                                        fontWeight : FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap:(){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => const FilterPage()));
                                    },
                                    child: Container(
                                      height: height * 0.05,
                                      width: height * 0.05,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.shade200,
                                            blurRadius: 2,
                                            spreadRadius: 2,
                                          )
                                        ],
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(width * 0.02),
                                        child: FittedBox(
                                          child: Image.asset(AppImages.filter),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: width * 0.03),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      Text("Recipe Of The day",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.aBeeZee(
                          fontSize: (width/Screen.designWidth)*40,
                          color: Colors.black,
                          fontWeight : FontWeight.bold,
                        ),
                      ),
                      const RecipeOfTheDay(),
                      SizedBox(height: height * 0.02),
                      Text("Recipe Category",
                        style: GoogleFonts.aBeeZee(
                          fontSize: (width/Screen.designWidth)*40,
                          color: Colors.black,
                          fontWeight : FontWeight.bold,
                        ),
                      ),
                      const CategoriesView(),
                      SizedBox(height: height * 0.02),
                      Text("Just For You",
                        style: GoogleFonts.aBeeZee(
                          fontSize: (width/Screen.designWidth)*40,
                          color: Colors.black,
                          fontWeight : FontWeight.bold,
                        ),
                      ),
                      const MealsView(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}