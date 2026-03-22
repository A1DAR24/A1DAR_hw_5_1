
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:lesson_5_1/data/model/rick_model.dart';

@Injectable()
class QuizApiService{

  
  Future<List<QuizModel>> getQuiz() async{
    final dio = Dio();
    final response = await dio.get("https://opentdb.com/api.php?amount=10");
    final data = response.data['results'];
    if(data is List){
      final list = (data as List).map((e) => QuizModel.fromJson(e)).toList() ;
    return list;
    }
    return[];
  }

}