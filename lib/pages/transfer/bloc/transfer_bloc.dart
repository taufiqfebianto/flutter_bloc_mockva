import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_mockva/repository/app_repo.dart';

import '../../../models/models.dart';

part 'transfer_event.dart';
part 'transfer_state.dart';

class TransferBloc extends Bloc<TransferEvent, TransferState> {
  AppRepo repo = AppRepo();
  TransferBloc() : super(TransferInitial()) {
    on<TransferEvent>((event, emit) {});

    on<TransferInquiryEvent>(
      (event, emit) async {
        try {
          TransferInquiryResponseModel response =
              await repo.transferInquiry(model: event.model);
          emit(TransferInquirySuccessState(response));
        } on DioError catch (e) {
          // ignore: use_rethrow_when_possible
          throw e;
        }
      },
    );
  }
}
