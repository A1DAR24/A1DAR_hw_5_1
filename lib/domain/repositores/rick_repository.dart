import 'package:dartz/dartz.dart';
import 'package:lesson_5_1/core/error/failure.dart';
import 'package:lesson_5_1/data/model/rick_model.dart';

abstract class RickRepository {
  Future<Either<Failure, RickModel>> getCharacters();
  
  Future<Either<Failure, RickResults>> getCharacterDetail(int id);
  Future<Either<Failure, List<QuizModel>>> getQuiz();
}