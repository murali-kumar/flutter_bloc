part of 'photo_bloc.dart';

abstract class PhotoState extends Equatable {
  const PhotoState();

  @override
  List<Object> get props => [];
}

class PhotoInitialState extends PhotoState {}

class PhotoLoadingState extends PhotoState {}

class PhotoLoadedState extends PhotoState {
  final List<PhotoInfo> dataList;
  const PhotoLoadedState({required this.dataList});

  @override
  List<Object> get props => [dataList];
}

class PhotoErrorState extends PhotoState {
  final String errorMessage;
  const PhotoErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
