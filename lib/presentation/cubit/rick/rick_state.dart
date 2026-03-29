part of 'rick_cubit.dart';

@immutable
sealed class RickState {}

final class RickInitial extends RickState {}

final class LoadingState extends RickState {}

final class ErrorState extends RickState {
  final String error;
  ErrorState(this.error);
}

final class SuccesState extends RickState {
  final List<RickResults> allCharacters;
  final bool hasNext; 

  SuccesState({required this.allCharacters, required this.hasNext});
}