
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:lesson_5_1/core/error/failure.dart';
import 'package:lesson_5_1/data/data_sours/quiz_api_service.dart';
import 'package:lesson_5_1/data/data_sours/rick_api_service.dart';
import 'package:lesson_5_1/data/model/rick_model.dart';
import 'package:lesson_5_1/domain/repositores/rick_repository.dart';

@LazySingleton(as: RickRepository)
class RickRepositoryImpl implements RickRepository {
  RickRepositoryImpl({required this.apiService});

  final RickApiService apiService;


  @override
  Future<Either<Failure, RickModel>> getCharacters() async{
    try{
      final list = await apiService.getCharacters();
      return Right(list);
    }on DioException catch(e){
      return Left(ServerFailure(message: e.response?.data['message'] ?? "Server error" ));
    }catch(e){
      return Left(UnImplementedFailure(message: e.toString()));
    }
  }

  @override
Future<Either<Failure, RickResults>> getCharacterDetail(int id) async {
  try {
    final result = await apiService.getDeteilCharacter(id);
    return Right(result);
  } on DioException catch (e) {
    return Left(ServerFailure(message: e.response?.data['error'] ?? "Not found"));
  } catch (e) {
    return Left(UnImplementedFailure(message: e.toString()));
  }
}

  @override
  Future<Either<Failure, List<QuizModel>>> getQuiz() async{
    try {
    final list = await QuizApiService().getQuiz();
    return Right(list);
  } on DioException catch (e) {
    return Left(ServerFailure(message: e.response?.data['error'] ?? "Not found"));
  } catch (e) {
    return Left(UnImplementedFailure(message: e.toString()));
  }
  }

}