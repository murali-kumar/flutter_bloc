part of 'app_data_bloc.dart';

abstract class AppDataState extends Equatable {
  const AppDataState();

  @override
  List<Object> get props => [];
}

class AppDataInitialState extends AppDataState {
  @override
  List<Object> get props => [];
}

class AppDataLoadingState extends AppDataState {
  @override
  List<Object> get props => [];
}

class AppDataLoadedState extends AppDataState {
  final List<int> dataList;
  const AppDataLoadedState({required this.dataList});

  @override
  List<Object> get props => [dataList];
}

class AppDataErrorState extends AppDataState {
  final String errorMessage;
  const AppDataErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
