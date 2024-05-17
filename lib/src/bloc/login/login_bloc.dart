import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter101/src/models/user.dart';
import 'package:flutter101/src/pages/app.dart';
import 'package:flutter101/src/pages/routes.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    //Add
    // on<LoginEventAdd>((event, emit) {
    //   //execute something

    //   emit(state.coppyWith(count: state.count + 1));
    // });
    //Remove
    // on<LoginEventRemove>((event, emit) {
    //   emit(state.coppyWith(count: state.count - 1));
    // });

    //Login
    on<LoginEventLogin>((event, emit) {
      if (event.payload.username == 'admin' &&
          event.payload.password == '1234') {
        emit(state.coppyWith(isAutthencation: true));
        //Define Globalkey app.dart
        if (navigatorState.currentContext != null) {
          Navigator.pushReplacementNamed(
              navigatorState.currentContext!, AppRoute.home);
        }
      } else {
        emit(state.coppyWith(isAutthencation: false));
      }
    });
  }
}
