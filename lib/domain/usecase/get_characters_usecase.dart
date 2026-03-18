import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:lesson_5_1/core/error/failure.dart';
import 'package:lesson_5_1/data/model/rick_model.dart';
import 'package:lesson_5_1/core/usecase/usecase.dart';
import 'package:lesson_5_1/domain/repositores/rick_repository.dart';

@lazySingleton
class GetCharactersUsecase implements UseCase<RickModel, NoParam>{
  final RickRepository repository;

  GetCharactersUsecase({required this.repository});

  @override
  Future<Either<Failure, RickModel>> call(params) async {
    return repository.getCharacters();
  }

  
}

class NoParam{}
