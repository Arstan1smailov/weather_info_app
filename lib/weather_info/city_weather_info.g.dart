// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_weather_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityWeather _$CityWeatherFromJson(Map<String, dynamic> json) {
  return CityWeather(
    Weather.fromJson(json['weather'][0] as Map<String, dynamic>),
    Main.fromJson(json['main'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CityWeatherToJson(CityWeather instance) =>
    <String, dynamic>{
      'weather': instance.weather,
      'main': instance.main,
    };
