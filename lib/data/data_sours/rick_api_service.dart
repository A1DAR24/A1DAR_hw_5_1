

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:lesson_5_1/data/model/rick_model.dart';

@Injectable() 
class RickApiService {
  final Dio _dio = Dio();

  Future<RickModel> getCharacters({String? nextUrl}) async {
    final String url = nextUrl ?? "https://rickandmortyapi.com/api/character";
    
    final response = await _dio.get(url);
    
    return RickModel.fromJson(response.data);
  }

  Future<RickResults> getDeteilCharacter(int id) async{
    final dio = Dio();
    final response = await dio.get("https://rickandmortyapi.com/api/character/$id");
    final data = RickResults.fromJson(response.data);
    return data;
  }
}