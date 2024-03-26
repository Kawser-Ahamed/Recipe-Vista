import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipevista/data/Screen.dart';
import 'package:recipevista/utils/reusable/arrow_icon.dart';
import 'package:recipevista/utils/reusable/favourite_icon.dart';
import 'package:recipevista/view_model/category/categories_view_model.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  
  @override
  Widget build(BuildContext context) {
    double height = Screen.screenHeight(context);
    double width = Screen.screenWidth(context);
    return Consumer<CategoriesViewModel>(
      builder: (context, categoriesViewModel, child) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              categoriesViewModel.categoriesdata.length, 
              (index){
                return Card(
                  elevation: 0,
                  color: Colors.white,
                  child: Container(
                    width: width * 0.5,
                    margin: EdgeInsets.only(right: width * 0.02),
                    decoration: BoxDecoration(
                      color: (index%2==0) ? Colors.teal[200] : (index%3==0) ? Colors.lightBlue[200] : Colors.amber,
                      borderRadius: BorderRadius.circular((width/Screen.designWidth)*20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 2,
                          spreadRadius: 2,
                        )
                      ]
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: height * 0.2,
                          width: width * 0.5,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            image: DecorationImage(
                              image: NetworkImage(categoriesViewModel.categoriesdata[index].strCategoryThumb.toString()),
                            )                                            
                          ),
                        ),
                        Text(categoriesViewModel.categoriesdata[index].strCategory.toString(),
                          style: TextStyle(
                            fontSize: (width/Screen.designWidth) * 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ExpandableText(categoriesViewModel.categoriesdata[index].strCategoryDescription.toString(), 
                          maxLines: 2,
                          expandText: 'See more',
                          collapseText: 'See less',
                          linkColor: Colors.white,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: (width/Screen.designWidth)*20,
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FavouriteIcon(),
                            ArrowIcon(),
                          ],
                        ),
                        SizedBox(height: height * 0.02),
                      ],
                    ),
                  ),
                );
              }
            ),
          ),
        );
      },
    );
  }
}