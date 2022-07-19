import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_validation/src/bloc/login/login_bloc.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emalController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emalController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In with Email'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state is LoginErrorState) {
                    return Text(
                      state.errorMessage,
                      style: const TextStyle(color: Colors.red),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _emalController,
                onChanged: (val) {
                  context.read<LoginBloc>().add(LoginTextChangedEvent(
                      _emalController.text, _passwordController.text));
                },
                decoration: const InputDecoration(hintText: 'Email Address'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _passwordController,
                onChanged: (val) {
                  context.read<LoginBloc>().add(LoginTextChangedEvent(
                      _emalController.text, _passwordController.text));
                },
                decoration: const InputDecoration(hintText: 'Password'),
              ),
              const SizedBox(
                height: 10,
              ),
              BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
                if (state is LoginLoadinState) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ElevatedButton(
                  onPressed: () {
                    if (state is LoginValidState) {
                      context.read<LoginBloc>().add(LoginSubmittedEvent(
                          _emalController.text, _passwordController.text));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      primary: (state is LoginValidState)
                          ? Colors.blue
                          : Colors.grey),
                  child: const Text('Sign In'),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
