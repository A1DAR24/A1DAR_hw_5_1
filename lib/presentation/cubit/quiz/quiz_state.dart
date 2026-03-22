part of 'quiz_cubit.dart';

@immutable
sealed class QuizState {}

final class QuizInitial extends QuizState {}

final class LoadingState extends QuizState {}

final class ErrorState extends QuizState {
  final String error;

  ErrorState(this.error);
}

final class SuccessState extends QuizState {
  final QuizModel question;
  final int currentIndex;
  final int totalQuestions;

  SuccessState({
    required this.question,
    required this.currentIndex,
    required this.totalQuestions,
  });
}

final class QuizFinishedState extends QuizState {}
