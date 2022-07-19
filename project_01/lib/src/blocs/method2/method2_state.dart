part of 'method2_bloc.dart';

abstract class Method2State extends Equatable {
  const Method2State();

  @override
  List<Object> get props => [];
}

class Method2InitialState extends Method2State {}

class Method2LoadingState extends Method2State {
  @override
  List<Object> get props => [];
}

class Method2LoadedState extends Method2State {
  final List<int> dataList;
  const Method2LoadedState({required this.dataList});

  @override
  List<Object> get props => [dataList];
}

class Method2ErrorState extends Method2State {
  final String errorMessage;
  const Method2ErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
