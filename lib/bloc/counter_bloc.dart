import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  //* [CounterInitial] отвечает за начальное значение счетчика, думаю тут очевидно
  CounterBloc() : super(const CounterInitial(counter: 0));

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    if (event is IncrementEvent) {
      yield CounterIncremented(counter: state.counter + 1);
    } else if (event is DecrementEvent) {
      yield CounterDecremented(counter: state.counter - 1);
    } else {
      //* Обнуление при ошибке, держу в курсе, этого никогда не будет
      yield const CounterError(counter: 0);
    }
  }
}
