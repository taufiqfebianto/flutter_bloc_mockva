part of 'account_bloc.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object> get props => [];
}

class SignOutEvent extends AccountEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'SignOutEvent : ';
  }
}
