import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_data_event.dart';
part 'app_data_state.dart';

class AppDataBloc extends Bloc<AppDataEvent, AppDataState> {
  AppDataBloc() : super(AppDataInitialState()) {
    on<AppDataLoadEvent>(_mapLoadEventToState);
    on<AppDataAddEvent>(_mapDataAddEventToState);
    on<AppDataRemoveEvent>(_mapDataRemoveEventToState);
  }

  Future<void> _mapLoadEventToState(
      AppDataLoadEvent event, Emitter<AppDataState> emit) async {
    emit(AppDataLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    emit(const AppDataLoadedState(dataList: [1, 2, 3, 4, 5]));
  }

  Future<void> _mapDataAddEventToState(
      AppDataAddEvent event, Emitter<AppDataState> emit) async {
    //duplicate the data
    List<int> storedDataList = [...(state as AppDataLoadedState).dataList];
    emit(AppDataLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    storedDataList.add(event.addValue);
    emit(AppDataLoadedState(dataList: storedDataList));
  }

  void _mapDataRemoveEventToState(
      AppDataRemoveEvent event, Emitter<AppDataState> emit) {
    emit(const AppDataLoadedState(dataList: []));
  }

  //
}
