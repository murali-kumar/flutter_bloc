import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginIntialState()) {
    on<LoginTextChangedEvent>(_mapLoginTextChangedEventToState);
    on<LoginSubmittedEvent>(_mapLoginSubmittedEventToState);
  }
  void _mapLoginTextChangedEventToState(
      LoginTextChangedEvent event, Emitter<LoginState> emit) async {
    if (event.emailValue == '' ||
        EmailValidator.validate(event.emailValue) == false) {
      emit(LoginErrorState('Please enter a valid email address'));
    } else if (event.passwordValue.length < 8) {
      emit(LoginErrorState('Please enter a valid password'));
    } else {
      emit(LoginValidState());
    }
  }

  void _mapLoginSubmittedEventToState(
      LoginSubmittedEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoadinState());
  }
}
