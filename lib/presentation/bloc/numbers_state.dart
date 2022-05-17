part of 'numbers_bloc.dart';

abstract class NumbersState extends Equatable {
  const NumbersState();

  @override
  List<Object> get props => [];
}

class NumbersLoading extends NumbersState {}

class NumbersGenerating extends NumbersState {
  final int number;

  const NumbersGenerating(this.number);

  @override
  List<Object> get props => [number];
}

class NumbersGenerateFailed extends NumbersState {}
