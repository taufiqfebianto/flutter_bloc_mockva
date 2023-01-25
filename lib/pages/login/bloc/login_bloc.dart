import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc_mockva/models/models.dart';
import 'package:flutter_bloc_mockva/repository/app_repo.dart';

import '../../../shared/shared.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AppRepo repo = AppRepo();
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {});
    on<SignInEvent>((event, emit) async {
      try {
        LoginResponseModel response = await repo.signIn(
            username: event.username, password: event.password);
        await storage.putString(
            boxName: describeEnum(StorageConstants.user),
            value: response.id,
            key: 'sessionId');
        await storage.putString(
            boxName: describeEnum(StorageConstants.user),
            value: response.accountId,
            key: 'accountId');
        emit(SignInSuccessState(response));
      } on DioError catch (e) {
        emit(SignInFailedState(
            message: e.response?.data,
            statusCode: e.response?.statusCode,
            errorMessage: e.response?.statusMessage));
      }
    });
  }
}
