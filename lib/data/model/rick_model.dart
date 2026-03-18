import 'package:json_annotation/json_annotation.dart';

part 'rick_model.g.dart';

@JsonSerializable()
class RickModel {
  RickModel({required this.results});

  final List<RickResults> results;

  factory RickModel.fromJson(Map<String, dynamic> json) => _$RickModelFromJson(json);
}

@JsonSerializable()
class RickResults{
  RickResults({required this.name, required this.image, required this.id});

  final int id;
  final String name;
  final String image;

  factory RickResults.fromJson(Map<String, dynamic> json) => _$RickResultsFromJson(json);
}