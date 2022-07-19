import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/src/models/weather.dart';
import 'package:weatherapp/src/repositories/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final _weatherRepository = WeatherRepository();

  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherRequest>(_mapWeatherRequestEventToState);
  }
//
  void _mapWeatherRequestEventToState(
      WeatherRequest event, Emitter<WeatherState> emit) async {
    emit(WeatherLoadInProgress());

    try {
      final weatherResponse =
          await _weatherRepository.getWeather(event.cityName);
      emit(WeatherLoadSuccess(weather: weatherResponse));
    } catch (e) {
      emit(WeatherLoadFailure(error: e.toString()));
    }
  }

  //
  @override
  Future<void> close() {
    _weatherRepository.dispose();
    return super.close();
  }
  //
}
