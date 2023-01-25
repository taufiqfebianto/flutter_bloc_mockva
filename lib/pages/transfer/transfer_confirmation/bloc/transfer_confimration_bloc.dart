import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../models/models.dart';
import '../../../../repository/app_repo.dart';

part 'transfer_confimration_event.dart';
part 'transfer_confimration_state.dart';

class TransferConfimrationBloc
    extends Bloc<TransferConfimrationEvent, TransferConfimrationState> {
  TransferConfimrationBloc() : super(TransferConfimrationInitial()) {
    AppRepo repo = AppRepo();
    on<TransferConfimrationEvent>((event, emit) {});
    on<TransferConfirmationEvent>(
      (event, emit) async {
        try {
          TransferResponseModel response =
              await repo.transferConfirmation(model: event.model);
          emit(TransferConfirmationSuccessState(response));
        } on DioError catch (e) {
// ignore: use_rethrow_when_possible
          throw e;
        }
      },
    );
  }
}
