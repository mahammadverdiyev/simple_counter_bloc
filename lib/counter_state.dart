import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  final int value;

  CounterState(this.value);

  @override
  List<Object?> get props => [value];
}

class LimitState extends CounterState {
  final String message;

  LimitState(this.message, int currentValue) : super(currentValue);

  @override
  List<Object?> get props => [message];
}
