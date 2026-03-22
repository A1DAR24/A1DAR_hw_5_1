

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:lesson_5_1/data/model/rick_model.dart';

@Injectable()
class RickApiService{

  
  Future<RickModel> getCharacters() async{
    final dio = Dio();
    final response = await dio.get("https://rickandmortyapi.com/api/character");
    final data = RickModel.fromJson(response.data);
    return data;
  }

  Future<RickResults> getDeteilCharacter(int id) async{
    final dio = Dio();
    final response = await dio.get("https://rickandmortyapi.com/api/character/$id");
    final data = RickResults.fromJson(response.data);
    return data;
  }
}