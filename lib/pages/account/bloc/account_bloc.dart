import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_mockva/repository/app_repo.dart';

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
        } on DioError catch (e) {
          // ignore: use_rethrow_when_possible
          throw e;
        }
      },
    );
  }
}
