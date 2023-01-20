part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetAccountDetailEvent extends HomeEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'GetAccountDetailEvent : ';
  }
}
