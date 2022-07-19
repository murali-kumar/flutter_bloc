import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'method2_event.dart';
part 'method2_state.dart';

class Method2Bloc extends Bloc<Method2Event, Method2State> {
  List<int> numDataList = [1, 2, 3, 4, 5];

  Method2Bloc() : super(Method2InitialState()) {
    on<Method2LoadEvent>(_mapLoadEventToState);
    on<Method2AddEvent>(_mapDataAddEventToState);
    on<Method2RemoveEvent>(_mapDataRemoveEventToState);
  }

  Future<void> _mapLoadEventToState(
      Method2LoadEvent event, Emitter<Method2State> emit) async {
    emit(Method2LoadingState());
    await Future.delayed(const Duration(seconds: 1));
    emit(Method2LoadedState(dataList: numDataList));
  }

  Future<void> _mapDataAddEventToState(
      Method2AddEvent event, Emitter<Method2State> emit) async {
    emit(Method2LoadingState());
    await Future.delayed(const Duration(seconds: 1));
    numDataList.add(event.addValue);
    emit(Method2LoadedState(dataList: numDataList));
  }

  void _mapDataRemoveEventToState(
      Method2RemoveEvent event, Emitter<Method2State> emit) {
    //============================================
    //This is also working
    //emit(Method2LoadingState());
    //numDataList.clear();
    //============================================
    numDataList = [];
    emit(Method2LoadedState(dataList: numDataList));
  }

  //
}
