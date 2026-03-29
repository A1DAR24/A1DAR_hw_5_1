// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rick_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RickModel _$RickModelFromJson(Map<String, dynamic> json) => RickModel(
  InfoModel.fromJson(json['info'] as Map<String, dynamic>),
  (json['results'] as List<dynamic>)
      .map((e) => RickResults.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$RickModelToJson(RickModel instance) => <String, dynamic>{
  'results': instance.results,
  'info': instance.info,
};

RickResults _$RickResultsFromJson(Map<String, dynamic> json) => RickResults(
  name: json['name'] as String,
  image: json['image'] as String,
  id: (json['id'] as num).toInt(),
);

Map<String, dynamic> _$RickResultsToJson(RickResults instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };

InfoModel _$InfoModelFromJson(Map<String, dynamic> json) =>
    InfoModel(json['next'] as String?, json['prev'] as String?);

Map<String, dynamic> _$InfoModelToJson(InfoModel instance) => <String, dynamic>{
  'next': instance.next,
  'prev': instance.prev,
};

QuizModel _$QuizModelFromJson(Map<String, dynamic> json) => QuizModel(
  category: json['category'] as String,
  question: json['question'] as String,
  correctAnswer: json['correct_answer'] as String,
  incorrectAnswers: (json['incorrect_answers'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$QuizModelToJson(QuizModel instance) => <String, dynamic>{
  'category': instance.category,
  'question': instance.question,
  'correct_answer': instance.correctAnswer,
  'incorrect_answers': instance.incorrectAnswers,
};
