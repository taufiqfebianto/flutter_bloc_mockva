import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc_mockva/shared/storage.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) {});
    on<AppStarted>(
      (event, emit) async {
        String? A = '-';
        storage.putString(
            boxName: describeEnum(StorageConstants.user),
            key: 'sessionStatus',
            value: 'test');
        A = await storage.getString(
            boxName: describeEnum(StorageConstants.user), key: 'sessionStatus');
        debugPrint('sessingId : $A');
        if (A=='test') {
          emit(const AuthenticationUnauthenticated());
        } else {
          emit(const AuthenticationAuthenticated());
        }
      },
    );
    on<LoggedIn>((event, emit) async {
      emit(const AuthenticationAuthenticated());
    });
    on<LoggedOut>((event, emit) async {
      emit(const AuthenticationUnauthenticated());
    });
  }
}
