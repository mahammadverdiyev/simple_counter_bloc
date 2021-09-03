import 'dart:async';

import 'package:counter_bloc_practice/counter_event.dart';
import 'package:counter_bloc_practice/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(new CounterState(0));

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    int currentValue = this.state.value;

    if (currentValue == 10 && event is IncrementEvent) {
      yield new LimitState(
          "You hit the limit! Can not increment anymore", currentValue);
      return;
    }

    if (currentValue == -10 && event is DecrementEvent) {
      yield new LimitState(
          "You hit the minimum limit! Can not decrement anymore", currentValue);
      return;
    }

    if (event is IncrementEvent) {
      currentValue++;
    } else {
      currentValue--;
    }

    yield new CounterState(currentValue);
  }
}
