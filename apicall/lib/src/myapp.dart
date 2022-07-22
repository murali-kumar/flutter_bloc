import 'package:apicall/src/bloc/photo/photo_bloc.dart';
import 'package:apicall/src/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhotoBloc(),
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
