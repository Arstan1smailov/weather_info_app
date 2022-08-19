import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_info_app/extensions/capitalize.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../htpp_service.dart';
import '../model/json_main.dart';
import '../model/weather.dart';
import '../model/weather_info.dart';
import '../views/card1.dart';
import '../views/iconWeather.dart';
import '../views/search_box.dart';
import '../weather_info/city_weather_info.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  List<String> cities = [
    'Bishkek',
    'Moscow',
    'osh',
    'tokmok',
    'almaty',
    'prague',
    'rim',
    'new york',
    'vladivostok',
    'tokyo',
    'shanghai',
    'osaka',
    'mumbai',
    'cairo'
  ];
  List<WeatherInfo> cities2 = [];
  List<int> tempInCities = [];
  WeatherInfo? weatherInfo;
  String city = '';
  String appId = "&appid=c93f8cc9beb1256bb74e844e646f1ae4&units=metric";
  TextEditingController controller = TextEditingController();
  DateTime now = DateTime.now();
  IconData iconDayTime = Icons.sunny;

  @override
  Widget build(BuildContext context) {
    const Color COLOR_GREY2 = Color(0xFF6D6D6D);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        if (weatherInfo != null)
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: BorderBox(
                  hint: 'Search city',
                  width: double.infinity,
                  height: 60,
                  color: Colors.white,
                  city: sendRequest,
                ),
              ),
              IconWeather(weatherInfo!.desc),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      weatherInfo!.name,
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Icon(Icons.location_on),
                  ],
                ),
              ),
              Text(
                '${weatherInfo!.temp.toInt()}°',
                style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              Card1(
                  weatherInfo: weatherInfo!,
                  COLOR_GREY2: COLOR_GREY2),
            ],
          ),
      ]),
    );
  }

  @override
  void initState() {
    // for (var element in cities) {
    //   request(element);
    // }
    requestScreen('Bishkek');
  }

  void sendRequest(String city) async {
    Weather weather;
    Main main;
    CityWeather cityWeather;

    HttpService http = HttpService();
    Response response;
    try {
      response = await http.getRequest(city + appId);
      if (response.statusCode == 200) {
        setState(() {
          cityWeather = CityWeather.fromJson(response.data);
          main = cityWeather.main;
          weather = cityWeather.weather;
          weatherInfo = WeatherInfo(main.temp.toInt(), city.capitalize(),
              weather.desc, main.tempMax, main.tempFeel, main.tempMin);
          cities2.insert(
              0,
              WeatherInfo(main.temp.toInt(), city.capitalize(), weather.desc,
                  main.tempMax, main.tempFeel, main.tempMin));});
      }
    } on HttpException catch (e) {
      print(e.message);
    }
  }

  void request(String city) async {
    HttpService http = HttpService();
    Response response;
    Main main;
    Weather weather;
    CityWeather cityWeather;
    try {
      response = await http.getRequest(city + appId);
      if (response.statusCode == 200) {
        setState(() {
          cityWeather = CityWeather.fromJson(response.data);
          main = cityWeather.main;
          weather = cityWeather.weather;
          cities2.add(WeatherInfo(main.temp.toInt(), city.capitalize(),
              weather.desc, main.tempMax, main.tempFeel, main.tempMin));
          print(weather.desc);
        });
      }
    } on HttpException catch (e) {
      print(e.message);
    }
  }

  void requestScreen(String city) async {
    Weather weather;
    Main main;
    CityWeather cityWeather;

    HttpService http = HttpService();
    Response response;
    try {
      response = await http.getRequest(city + appId);
      if (response.statusCode == 200) {
        setState(() {
          cityWeather = CityWeather.fromJson(response.data);
          main = cityWeather.main;
          weather = cityWeather.weather;
          weatherInfo = WeatherInfo(main.temp.toInt(), city.capitalize(),
              weather.desc, main.tempMax, main.tempFeel, main.tempMin);
          print(weather.desc);
        });
      }
    } on HttpException catch (e) {
      print(e.message);
    }
  }
}

