import 'package:json_annotation/json_annotation.dart';
import 'package:weather_info_app/model/json_main.dart';
import 'package:weather_info_app/model/weather.dart';

part 'city_weather_info.g.dart';
@JsonSerializable()
class CityWeather {
  CityWeather(this.weather, this.main);

  @JsonKey(name: "weather")
  Weather weather;
  @JsonKey(name: "main")
  Main main;

  factory CityWeather.fromJson(Map<String, dynamic> json) =>
      _$CityWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$CityWeatherToJson(this);
}
