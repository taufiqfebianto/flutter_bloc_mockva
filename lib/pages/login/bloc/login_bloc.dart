import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_mockva/models/models.dart';
import 'package:flutter_bloc_mockva/repository/app_repo.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AppRepo repo = AppRepo();
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {});
    on<SignInEvent>((event, emit) async {
      try {
        LoginResponseModel response = await repo.login();
        debugPrint(event.toString());
      } on DioError catch (e) {
        throw e;
      }
      // emit(const SignInSuccess());
    });
  }
}
