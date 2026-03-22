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
  RickCubit({required GetCharactersUsecase getCharactersUsecase, required GetCharacterDetailUsecase getCharacterDetailUsecase})
    : _getCharactersUsecase = getCharactersUsecase,
    _getCharacterDetailUsecase = getCharacterDetailUsecase,
      super(RickInitial());

  void getCharacters() async {
    emit(LoadingState());
    final either = await _getCharactersUsecase.call(NoParam());
    either.fold(
      (failure) => emit(ErrorState(failure.message)),
      (response) => emit(SuccesState(response)),
    );
  }

  void getCharacterDetail(int id) async {
    emit(LoadingState());
    final either = await _getCharacterDetailUsecase.call(id);
    
    either.fold(
      (failure) => emit(ErrorState(failure.message)),
      (character) => emit(SuccesDeteilState(rickResults: character)), 
    );
  }

}
