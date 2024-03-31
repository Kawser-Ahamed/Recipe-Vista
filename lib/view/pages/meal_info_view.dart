import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:recipevista/data/screen.dart';
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
    final TabController controller = TabController(length: 3, vsync: this);
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
                                color: Colors.grey.shade300,
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
                              color: Colors.grey.shade300,
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
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(left: width * 0.03),
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
                          SizedBox(height: height * 0.03),
                          TabBar(
                            controller: controller,
                            unselectedLabelColor: Colors.black,
                            labelColor: AppColor.primaryColor,
                            indicatorColor: AppColor.primaryColor,
                            indicatorSize: TabBarIndicatorSize.label,
                            dividerColor: Colors.transparent,
                            tabs: const [
                              Text("hahsd"),
                              Text("jsdjs"),
                              Text("udushd"),
                            ]
                          ),
                          SizedBox(
                            height: height * 0.1,
                            child: TabBarView(
                              controller: controller,
                              children: const [
                                Text("1"),
                                Text("2"),
                                Text("3"),
                              ]
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}