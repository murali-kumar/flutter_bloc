import 'package:apicall/src/model/photo_info.dart';
import 'package:apicall/src/repository/api_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'photo_event.dart';
part 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  late ApiRepository apiRepository;

  PhotoBloc() : super(PhotoInitialState()) {
    apiRepository = ApiRepository();
    on<PhotoLoadEvent>(_mapLoadEventToState);
  }

  Future<void> _mapLoadEventToState(
      PhotoLoadEvent event, Emitter<PhotoState> emit) async {
    emit(PhotoLoadingState());
    try {
      List<PhotoInfo> photoDataList = await apiRepository.fetchPhotosData();
      emit(PhotoLoadedState(dataList: photoDataList));
    } catch (e) {
      emit(PhotoErrorState(e.toString()));
    }
  }
}
