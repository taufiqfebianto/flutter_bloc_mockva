import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_mockva/models/history_transaction_response_model.dart';
import 'package:flutter_bloc_mockva/repository/app_repo.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  AppRepo repo = AppRepo();
  HistoryBloc() : super(HistoryInitial()) {
    on<HistoryEvent>((event, emit) {});
    on<GetHistoryTransactionEvent>(
      (event, emit) async {
        try {
          HistoryTransactionResponseModel response =
              await repo.getTransactionList();
              emit(GetHistoryTransactionSuccessState(response));
        } on DioError catch (e) {
// ignore: use_rethrow_when_possible
          throw e;
        }
      },
    );
  }
}
