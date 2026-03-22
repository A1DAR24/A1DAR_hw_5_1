import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lesson_5_1/data/model/rick_model.dart';
import 'package:lesson_5_1/domain/usecase/get_characters_usecase.dart';
import 'package:lesson_5_1/domain/usecase/get_quiz_usecase.dart';
part  'quiz_state.dart';

@Injectable()
class QuizCubit extends Cubit<QuizState> {
  final GetQuizUsecase getQuizUsecase;
  
  List<QuizModel> _allQuestions = [];
  int _currentIndex = 0;

  QuizCubit(this.getQuizUsecase) : super(QuizInitial());

  Future<void> loadQuiz() async {
    emit(LoadingState());
    final result = await getQuizUsecase(NoParam());
    
    result.fold(
      (failure) => emit(ErrorState(failure.toString())),
      (questions) {
        _allQuestions = questions;
        _currentIndex = 0;
        _emitCurrentQuestion();
      },
    );
  }

  void answerQuestion() {
    if (_currentIndex < _allQuestions.length - 1) {
      _currentIndex++;
      _emitCurrentQuestion();
    } else {
      emit(QuizFinishedState()); 
    }
  }

  void _emitCurrentQuestion() {
    emit(SuccessState(
      question: _allQuestions[_currentIndex],
      currentIndex: _currentIndex,
      totalQuestions: _allQuestions.length,
    ));
  }
}