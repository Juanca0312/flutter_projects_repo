part of 'counter_bloc.dart';

sealed class CounterEvent {
  const CounterEvent();
}

class CounterIncresed extends CounterEvent {
  final int value;

  CounterIncresed(this.value);
}

class CounterReset extends CounterEvent {
  CounterReset();
}
