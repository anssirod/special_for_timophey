part of 'counter_bloc.dart';

@immutable
abstract class CounterState extends Equatable {
  final int counter;

  const CounterState(this.counter);
}

//* Начальное состояние счетчика
class CounterInitial extends CounterState {
  const CounterInitial({int counter}) : super(counter);

  @override
  List<Object> get props => [counter];
}

//* Состояние счетчика после увеличения на 1
class CounterIncremented extends CounterState {
  const CounterIncremented({int counter}) : super(counter);

  @override
  List<Object> get props => [counter];
}

//* Состояние счетчика после уменьшения на 1
class CounterDecremented extends CounterState {
  const CounterDecremented({int counter}) : super(counter);

  @override
  List<Object> get props => [counter];
}

//* Эта шутка тут просто для галочки, тк я не знаю, что надо сделать
//* Чтобы коунтер выкинул еррор, тк у нас всего 2 кнопки
//* Также, если делать по хорошему, то она должна брать ошибку и преобразовывать ее строку
//* но тут я просто сделал заглушку, которая если что, просто обнулит счетчик
class CounterError extends CounterState {
  const CounterError({int counter}) : super(counter);

  @override
  List<Object> get props => ["Error"];
}
