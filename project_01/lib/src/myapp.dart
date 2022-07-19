import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_01/src/blocs/appdata/app_data_bloc.dart';
import 'package:project_01/src/blocs/method2/method2_bloc.dart';
import 'package:project_01/src/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppDataBloc>(
          create: (context) => AppDataBloc(),
        ),
        BlocProvider<Method2Bloc>(
          create: (context) => Method2Bloc(),
        ),
      ],
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
