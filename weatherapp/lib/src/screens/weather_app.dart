import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/src/blocs/weatherbloc/weather_bloc.dart';

class WeatherApp extends StatelessWidget {
  WeatherApp({Key? key}) : super(key: key);

  final _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        centerTitle: true,
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoadInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherLoadFailure) {
            return const Center(
              child: Text("Something went wrong"),
            );
          } else if (state is WeatherLoadSuccess) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextField(
                      controller: _cityController,
                      decoration: const InputDecoration(
                          hintText: 'Enter City Name',
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/sun.png',
                          width: 200,
                          height: 200,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          state.weather.name,
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          state.weather.main['temp'].toString(),
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_cityController.text.isNotEmpty) {
                          context.read<WeatherBloc>().add(
                                WeatherRequest(cityName: _cityController.text),
                              );
                        }
                      },
                      child: const Text('Get Weather'),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
