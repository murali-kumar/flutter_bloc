import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_validation/src/bloc/login/login_bloc.dart';
import 'package:login_validation/src/screens/login.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => LoginBloc(),
        child: const Login(),
      ),
    );
  }
}
