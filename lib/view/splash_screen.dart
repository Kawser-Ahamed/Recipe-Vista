import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:recipevista/data/Screen.dart';
import 'package:recipevista/resource/color/app_color.dart';
import 'package:recipevista/resource/images/app_images.dart';
import 'package:recipevista/view/pages/homepage.dart';
import 'package:recipevista/view_model/category/categories_view_model.dart';
import 'package:recipevista/view_model/recipe/recipe_of_the_day_view_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  bool isLoading = true;
  @override
  void initState() {
    Provider.of<RecipeOfThedayViewModel>(context,listen: false).getRandomRecipe(context).whenComplete((){
      Provider.of<CategoriesViewModel>(context,listen: false).getCategories().whenComplete((){
        isLoading = false;
        setState(() {
          
        });
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double height = Screen.screenHeight(context);
    double width = Screen.screenWidth(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: height * 0.4,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular((width/Screen.designWidth)*100)),
              ),
              child: Image.asset(AppImages.spashScreenImage),
            ),
          ),
          Positioned(
            top: height * 0.6,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.only(topRight: Radius.circular((width/Screen.designWidth)*100)),
              ),
            ),
          ),
          Positioned(
            top: height * 0.6,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular((width/Screen.designWidth)*100)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Let's Learn Cooking...!",
                    style: GoogleFonts.aBeeZee(
                      fontSize: (width /Screen.designWidth) * 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  (isLoading) ? SpinKitFadingCube(
                        itemBuilder: (context, index) {
                          return DecoratedBox(
                            decoration: BoxDecoration(
                              color: (index%2==0)? AppColor.primaryColor : AppColor.secondaryColor,
                            )
                          );
                        },
                      ) : 
                  InkWell(
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                    },
                    child: Material(
                      color: AppColor.secondaryColor,
                      borderRadius: BorderRadius.circular((width/Screen.designWidth)*20),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.3,vertical: height * 0.02),
                        child: Text("Let's Start",
                          style: GoogleFonts.aBeeZee(
                            fontSize: (width/Screen.designWidth)*30,
                            color: Colors.white,
                          ),
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
    );
  }
}