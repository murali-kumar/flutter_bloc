part of 'method2_bloc.dart';

abstract class Method2Event extends Equatable {
  const Method2Event();

  @override
  List<Object> get props => [];
}

class Method2LoadEvent extends Method2Event {}

class Method2AddEvent extends Method2Event {
  final int addValue;
  const Method2AddEvent({required this.addValue});

  @override
  List<Object> get props => [addValue];
}

class Method2RemoveEvent extends Method2Event {}
