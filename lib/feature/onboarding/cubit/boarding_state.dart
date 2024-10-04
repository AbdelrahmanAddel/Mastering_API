part of 'boarding_cubit.dart';

@immutable
sealed class BoardingState {}

final class BoardingInitial extends BoardingState {}
final class ChangeCurrentIndexSuccess extends BoardingState {}

