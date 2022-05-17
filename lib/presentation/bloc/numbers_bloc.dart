import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stream_flutter/data/numbers_datasource.dart';

part 'numbers_event.dart';
part 'numbers_state.dart';

class NumbersBloc extends Bloc<NumbersEvent, NumbersState> {
  final NumbersDatasource numbersDatasource;
  NumbersBloc(this.numbersDatasource) : super(NumbersLoading()) {
    on<GenerateNumbers>(_generateNumbers);
  }

  Future<void> _generateNumbers(GenerateNumbers event, Emitter<NumbersState> emit) async {
    await emit.forEach<int>(numbersDatasource.generateNumbers(), onData: ((data) => NumbersGenerating(data)));
  }
}
