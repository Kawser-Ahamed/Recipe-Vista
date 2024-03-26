import 'package:flutter/material.dart';
import 'package:recipevista/data/Screen.dart';

class FavouriteIcon extends StatefulWidget {
  const FavouriteIcon({super.key});

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
        child: const FittedBox(child: Icon(Icons.favorite_outline,color: Colors.pink)),
      ),
    );
  }
}