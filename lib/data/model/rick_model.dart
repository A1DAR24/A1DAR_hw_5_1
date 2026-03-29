import 'package:json_annotation/json_annotation.dart';

part 'rick_model.g.dart';

@JsonSerializable()
class RickModel {
  RickModel(this.info, this.results);

  final List<RickResults> results;
  final InfoModel info;

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

@JsonSerializable()
class InfoModel{
  InfoModel(this.next, this.prev);

  final String? next;
  final String? prev;

  factory InfoModel.fromJson(Map<String, dynamic> json) => _$InfoModelFromJson(json);
}

@JsonSerializable()
class QuizModel {
  final String category;
  final String question;
  @JsonKey(name: 'correct_answer')
  final String correctAnswer;
  @JsonKey(name: 'incorrect_answers')
  final List<String> incorrectAnswers; 

  QuizModel({
    required this.category,
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
  });

  List<String> get allAnswers {
    final list = [correctAnswer, ...incorrectAnswers];
    list.shuffle(); 
    return list;
  }

  factory QuizModel.fromJson(Map<String, dynamic> json) => _$QuizModelFromJson(json);
}