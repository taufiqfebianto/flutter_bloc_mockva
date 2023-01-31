import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_mockva/repository/app_repo.dart';

import '../../../models/models.dart';
import '../../../shared/shared.dart';

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
