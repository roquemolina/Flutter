part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

}

class CounterIncreased extends CounterEvent {
  final int value;

  const CounterIncreased(this.value);
  
  @override
  List<Object?> get props => throw UnimplementedError();

}
class CounterReset extends CounterEvent {

  const CounterReset();
  
  @override
  List<Object?> get props => throw UnimplementedError();

}