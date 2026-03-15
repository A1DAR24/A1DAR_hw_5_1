import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lesson_5_1/model/rick_model.dart';
import 'package:lesson_5_1/repository.dart';
import 'package:meta/meta.dart';

part 'rick_state.dart';

@Injectable()
class RickCubit extends Cubit<RickState> {
  final Repository repository;
  RickCubit({required this.repository}) : super(RickInitial());

  void getCharacters() async{
    emit(LoadingState());
    final response = await repository.getCharacters();
    emit(SuccesState(rickModel: response));
  }

  void getCharacterDeteil(int id) async{
    emit(LoadingState());
    final response = await repository.getDeteilCharacter(id);
    emit(SuccesDeteilState(rickResults: response));
  }
}
