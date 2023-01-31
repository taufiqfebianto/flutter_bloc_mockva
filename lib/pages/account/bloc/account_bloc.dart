import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_mockva/repository/app_repo.dart';

import '../../../shared/shared.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AppRepo repo = AppRepo();
  AccountBloc() : super(AccountInitial()) {
    on<AccountEvent>((event, emit) {});
    on<SignOutEvent>(
      (event, emit) async {
        try {
          await repo.signOut();
          emit(SignOutSuccessState());
        } on NetworkException catch (e) {
          emit(FailedState(
              message: e.responseMessage,
              statusCode: e.httpStatus,
              errorMessage: e.data));
        }
      },
    );
  }
}
