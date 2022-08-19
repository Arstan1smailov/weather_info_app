import 'package:json_annotation/json_annotation.dart';
part 'json_main.g.dart';

@JsonSerializable()
class Main {
  @JsonKey(name: 'temp')
  double temp;
  @JsonKey(name: 'feels_like')
  double tempFeel;
  @JsonKey(name: 'temp_max')
  double tempMax;
  @JsonKey(name: 'temp_min')
  double tempMin;

  Main(this.temp, this.tempFeel, this.tempMax, this.tempMin);

  factory Main.fromJson(Map<String, dynamic> json) =>
      _$MainFromJson(json);

  Map<String, dynamic> toJson() => _$MainToJson(this);
}
