import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_mockva/models/detail_account_response_model.dart';
import 'package:flutter_bloc_mockva/repository/app_repo.dart';

import '../../../shared/shared.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  AppRepo repo = AppRepo();
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<GetAccountDetailEvent>(
      (event, emit) async {
        try {
          DetailAccountResponseModel response = await repo.getAccountDetail();
          emit(GetAccountDetailSuccess(response));
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
