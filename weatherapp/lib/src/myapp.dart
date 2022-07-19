import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/src/blocs/weatherbloc/weather_bloc.dart';
import 'package:weatherapp/src/screens/weather_app.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          WeatherBloc()..add(WeatherRequest(cityName: 'Chennai')),
      child: MaterialApp(
        home: WeatherApp(),
      ),
    );
  }
}
