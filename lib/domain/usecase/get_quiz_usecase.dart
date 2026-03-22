import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:lesson_5_1/core/error/failure.dart';
import 'package:lesson_5_1/core/usecase/usecase.dart';
import 'package:lesson_5_1/data/model/rick_model.dart';
import 'package:lesson_5_1/domain/repositores/rick_repository.dart';
import 'package:lesson_5_1/domain/usecase/get_characters_usecase.dart';

@lazySingleton
class GetQuizUsecase implements UseCase<List<QuizModel>, NoParam> {
  final RickRepository repository;

  GetQuizUsecase({required this.repository});

  @override
  Future<Either<Failure, List<QuizModel>>> call(params) async {
    return repository.getQuiz();
  }
}