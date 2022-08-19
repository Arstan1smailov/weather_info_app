import 'package:flutter/material.dart';
import 'package:weather_info_app/model/weather_info.dart';

class Card1 extends StatelessWidget {
  final WeatherInfo weatherInfo;
  final Color COLOR_GREY2;

  const Card1({super.key, required this.weatherInfo, required this.COLOR_GREY2});

  @override
  Widget build(BuildContext context) {
    const Color COLOR_GREY = Color(0xFFFCFCFC);
    Color COLOR_GREY3 = Color(0xFFAFAFAF);
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45)
          ),
          height: 70,
          width: double.infinity,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
            ),
            color: COLOR_GREY,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30,7,30,0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('FEELS LIKE', style: TextStyle(
                          fontSize: 14,
                          color: COLOR_GREY3
                      ),),
                      Text('MAX TEMP', style: TextStyle(
                          fontSize: 14,
                          color: COLOR_GREY3,
                      ),),
                      Text('MIN TEMP', style: TextStyle(
                          fontSize: 14,
                          color: COLOR_GREY3
                      ),),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40,7,36,0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${weatherInfo.tempFeel}°', style: TextStyle(
                          fontSize: 18,
                          color: COLOR_GREY2
                      ),),
                      Text('${weatherInfo.tempMax}°', style: TextStyle(
                          fontSize: 18,
                          color: COLOR_GREY2
                      ),),
                      Text('${weatherInfo.tempMin}°', style: TextStyle(
                          fontSize: 18,
                          color: COLOR_GREY2
                      ),),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
