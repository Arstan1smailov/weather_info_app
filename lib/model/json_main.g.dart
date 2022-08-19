// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_main.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Main _$MainFromJson(Map<String, dynamic> json) {
  return Main(
    (json['temp'] as num).toDouble(),
    (json['feels_like'] as num).toDouble(),
    (json['temp_max'] as num).toDouble(),
    (json['temp_min'] as num).toDouble(),
  );
}

Map<String, dynamic> _$MainToJson(Main instance) => <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.tempFeel,
      'temp_max': instance.tempMax,
      'temp_min': instance.tempMin,
    };
