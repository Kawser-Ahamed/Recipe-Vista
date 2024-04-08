import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipevista/data/Screen.dart';
import 'package:recipevista/view_model/database/sqlite_database.dart';

class FavouriteIcon extends StatefulWidget {
  final String idMeal;
  const FavouriteIcon({super.key, required this.idMeal});

  @override
  State<FavouriteIcon> createState() => _FavouriteIconState();
}

class _FavouriteIconState extends State<FavouriteIcon> {
  @override
  Widget build(BuildContext context) {
    double height = Screen.screenHeight(context);
    double width = Screen.screenWidth(context);
    return Container(
      height: height * 0.05,
      width: height * 0.05,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: EdgeInsets.all(width * 0.01),
        child: FittedBox(
          child: Consumer<SqliteDatabase>(
            builder: (context, value, child) {
              return  Icon((value.myFavouriteDataMap.containsKey(widget.idMeal) ? Icons.favorite :Icons.favorite_outline),color: Colors.pink);
            },
          ),
        ),
      ),
    );
  }
}