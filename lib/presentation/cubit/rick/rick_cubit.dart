import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lesson_5_1/data/model/rick_model.dart';
import 'package:lesson_5_1/domain/usecase/get_character_detail_usecase.dart';
import 'package:lesson_5_1/domain/usecase/get_characters_usecase.dart';

part 'rick_state.dart';

@Injectable()
class RickCubit extends Cubit<RickState> {
  final GetCharactersUsecase _getCharactersUsecase;
  final GetCharacterDetailUsecase _getCharacterDetailUsecase;

  String? nextUrl;
  List<RickResults> allCharacters = [];
  bool isFetching = false;

  RickCubit({
    required GetCharactersUsecase getCharactersUsecase,
    required GetCharacterDetailUsecase getCharacterDetailUsecase,
  }) : _getCharactersUsecase = getCharactersUsecase,
       _getCharacterDetailUsecase = getCharacterDetailUsecase,
       super(RickInitial());

 
  void getCharacters() async {
    allCharacters.clear();
    emit(LoadingState());
    
    final either = await _getCharactersUsecase.call(null);
    either.fold(
      (failure) => emit(ErrorState(failure.message)), 
      (response) {
        nextUrl = response.info.next;
        allCharacters.addAll(response.results);
        emit(SuccesState(allCharacters: List.from(allCharacters), hasNext: nextUrl != null));
      },
    );
  }

 
  void getNextPage() async {
  if (isFetching || nextUrl == null) return;

  isFetching = true;

  try {
    final either = await _getCharactersUsecase.call(nextUrl);

    either.fold(
      (failure) {
        print("Ошибка загрузки: ${failure.message}");
        isFetching = false; 
      },
      (response) {
        nextUrl = response.info.next; 
        allCharacters.addAll(response.results);
        
        isFetching = false; 
        emit(SuccesState(
          allCharacters: List.from(allCharacters),
          hasNext: nextUrl != null,
        ));
      },
    );
  } catch (e) {
    isFetching = false;
    print("Критическая ошибка: $e");
  }
}
}