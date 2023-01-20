import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_mockva/pages/hometab/hometab_page.dart';
import 'package:flutter_bloc_mockva/pages/login/login_page.dart';
import 'package:flutter_bloc_mockva/pages/splash/splash_page.dart';
import '../pages/account/bloc/account_bloc.dart';
import '../pages/history/bloc/history_bloc.dart';
import '../pages/home/bloc/home_bloc.dart';
import '../pages/hometab/bloc/hometab_bloc.dart';
import '../pages/login/bloc/login_bloc.dart';
import '../pages/transfer/bloc/transfer_bloc.dart';
import '../pages/transfer/receipt_transfer/bloc/receipt_transfer_bloc.dart';
import '../pages/transfer/receipt_transfer/receipt_transfer_page.dart';
import '../pages/transfer/transfer_confirmation/bloc/transfer_confimration_bloc.dart';
import '../pages/transfer/transfer_confirmation/transfer_confirmation_page.dart';
import 'authentication/authentication_bloc.dart';

class Routers {
  static const String home = '/';
  static const String transferConfirmation = '/transferConfirmation';
  static const String receiptTransfer = '/receiptTransfer';

  final route = <String, WidgetBuilder>{
    Routers.home: (BuildContext context) {
      return BlocBuilder<AuthenticationBloc, AuthenticationState>(
          bloc: BlocProvider.of<AuthenticationBloc>(context),
          builder: (BuildContext context, AuthenticationState state) {
            if (state is AuthenticationAuthenticated) {
              return MultiBlocProvider(
                providers: [
                  BlocProvider<HometabBloc>(
                    create: (BuildContext context) => HometabBloc(),
                  ),
                  BlocProvider<HomeBloc>(
                    create: (BuildContext context) => HomeBloc(),
                  ),
                  BlocProvider<TransferBloc>(
                    create: (BuildContext context) => TransferBloc(),
                  ),
                  BlocProvider<HistoryBloc>(
                    create: (BuildContext context) => HistoryBloc(),
                  ),
                  BlocProvider<AccountBloc>(
                    create: (BuildContext context) => AccountBloc(),
                  ),
                ],
                child: const HomeTabPage(),
              );
            }

            if (state is AuthenticationUnauthenticated) {
              return MultiBlocProvider(providers: [
                BlocProvider<LoginBloc>(
                  create: (BuildContext context) => LoginBloc(),
                ),
              ], child: const LoginPage());
            }

            return const SplashPage();
          });
    },
    Routers.transferConfirmation: (BuildContext context) {
      return BlocProvider<TransferConfimrationBloc>(
        create: (BuildContext context) => TransferConfimrationBloc(),
        child: const TransferConfirmationPage(),
      );
    },
    Routers.receiptTransfer: (BuildContext context) {
      return BlocProvider<ReceiptTransferBloc>(
        create: (BuildContext context) => ReceiptTransferBloc(),
        child: const ReceiptTransferPage(),
      );
    },
  };
}
