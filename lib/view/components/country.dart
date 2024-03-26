import 'package:flutter/material.dart';
import 'package:recipevista/data/country_data.dart';
import 'package:recipevista/data/screen.dart';

class Country extends StatefulWidget {
  const Country({super.key});

  @override
  State<Country> createState() => _CountryState();
}

class _CountryState extends State<Country> {
  @override
  Widget build(BuildContext context) {
    double height = Screen.screenHeight(context);
    double width = Screen.screenWidth(context);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:  List.generate(
          CountryData.countryData.length, 
          (index){
            return Padding(
              padding: EdgeInsets.only(right: width * 0.03),
              child: Card(
                elevation: 0,
                color: Colors.transparent,
                child: Column(
                  children: [
                    Container(
                      height: height * 0.1,
                      width: height * 0.1,
                      decoration: BoxDecoration(
                        color: CountryData.countryData[index]['color'],
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(width * 0.04),
                        child: Image.asset(CountryData.countryData[index]['imageUrl']),
                      ),
                    ),
                    Text(CountryData.countryData[index]['name']),
                  ],
                )
              ),
            );
          }
        )
      ),
    );
  }
}