part of 'history_bloc.dart';

abstract class HistoryState extends Equatable {
  const HistoryState();

  @override
  List<Object> get props => [];
}

class HistoryInitial extends HistoryState {}

class GetHistoryTransactionSuccessState extends HistoryState {
  final HistoryTransactionResponseModel model;

  const GetHistoryTransactionSuccessState(this.model);
  @override
  List<Object> get props => [model];

  @override
  String toString() {
    return 'GetHistoryTransactionSuccessState : ${model.toJson()}';
  }
}
