part of 'history_bloc.dart';

abstract class HistoryEvent extends Equatable {
  const HistoryEvent();

  @override
  List<Object> get props => [];
}

class GetHistoryTransactionEvent extends HistoryEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'GetHistoryTransactionEvent : ';
  }
}
