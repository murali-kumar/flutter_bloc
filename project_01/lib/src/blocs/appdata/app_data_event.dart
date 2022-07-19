part of 'app_data_bloc.dart';

abstract class AppDataEvent extends Equatable {
  const AppDataEvent();

  @override
  List<Object?> get props => [];
}

class AppDataLoadEvent extends AppDataEvent {
  @override
  List<Object?> get props => [];
}

class AppDataAddEvent extends AppDataEvent {
  final int addValue;
  const AppDataAddEvent({required this.addValue});

  @override
  List<Object> get props => [addValue];
}

class AppDataRemoveEvent extends AppDataEvent {}
