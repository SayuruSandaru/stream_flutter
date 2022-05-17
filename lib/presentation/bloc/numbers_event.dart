part of 'numbers_bloc.dart';

abstract class NumbersEvent extends Equatable {
  const NumbersEvent();

  @override
  List<Object> get props => [];
}

class GenerateNumbers extends NumbersEvent {}
