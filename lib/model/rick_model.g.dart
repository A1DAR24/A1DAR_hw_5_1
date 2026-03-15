// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rick_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RickModel _$RickModelFromJson(Map<String, dynamic> json) => RickModel(
  results: (json['results'] as List<dynamic>)
      .map((e) => RickResults.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$RickModelToJson(RickModel instance) => <String, dynamic>{
  'results': instance.results,
};

RickResults _$RickResultsFromJson(Map<String, dynamic> json) =>
    RickResults(name: json['name'] as String, image: json['image'] as String, id: json['id']);

Map<String, dynamic> _$RickResultsToJson(RickResults instance) =>
    <String, dynamic>{'name': instance.name, 'image': instance.image};
