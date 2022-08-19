import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_info_app/model/weather_info.dart';

class SecondScreen extends StatelessWidget {
  WeatherInfo weatherInfo;
  SecondScreen(this.weatherInfo);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(weatherInfo.name),
            Text(
              '${weatherInfo.temp.toInt()}°',
              style: const TextStyle(fontSize: 32),
            ),
            Text(weatherInfo.desc)
          ],
        ),
      ),
    );
  }
}
