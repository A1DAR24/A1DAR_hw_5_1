part of 'rick_cubit.dart';

@immutable
sealed class RickState {}

final class RickInitial extends RickState {}

final class LoadingState extends RickState {}

final class ErrorState extends RickState {}

final class SuccesState extends RickState {
  final RickModel rickModel;

  SuccesState({required this.rickModel});
}

final class SuccesDeteilState extends RickState {
  final RickResults rickResults;

  SuccesDeteilState({required this.rickResults});
}