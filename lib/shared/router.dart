import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_mockva/pages/hometab/hometab_page.dart';
import 'package:flutter_bloc_mockva/pages/login/login_page.dart';
import '../pages/account/bloc/account_bloc.dart';
import '../pages/history/bloc/history_bloc.dart';
import '../pages/home/bloc/home_bloc.dart';
import '../pages/hometab/bloc/hometab_bloc.dart';
import '../pages/login/bloc/login_bloc.dart';
import '../pages/transfer/bloc/transfer_bloc.dart';
import '../pages/transfer/transfer_confirmation/transfer_confirmation_page.dart';
import 'authentication/authentication_bloc.dart';

class Routers {
  static const String main = '/';
  static const String transferConfirmation = '/transferConfirmation';

  final route = <String, WidgetBuilder>{
    Routers.main: (BuildContext context) {
      return BlocBuilder<AuthenticationBloc, AuthenticationState>(
          bloc: BlocProvider.of<AuthenticationBloc>(context),
          builder: (BuildContext context, AuthenticationState state) {
            if (state is AuthenticationAuthenticated) {
              debugPrint('state : $state');
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
              debugPrint('state : $state');
              return MultiBlocProvider(providers: [
                BlocProvider<LoginBloc>(
                  create: (BuildContext context) => LoginBloc(),
                ),
              ], child: const LoginPage());
            }

            return const CircularProgressIndicator.adaptive();
          });
    },
    Routers.transferConfirmation: (BuildContext context) {
      return BlocProvider<TransferBloc>(
        create: (BuildContext context) => TransferBloc(),
        child: const TransferConfirmationPage(),
      );
    },
    // static Widget _mainPageRouteBuilder(
    //         BuildContext context, GoRouterState state) =>
    //     const LoginPage();
    // static Widget _homePageRouteBuilder(
    //         BuildContext context, GoRouterState state) =>
    //     const HomePage();
    // static Widget _transferPageRouteBuilder(
    //         BuildContext context, GoRouterState state) =>
    //     const TransferPage();
    // static Widget _transferConfirmationPageRouteBuilder(
    //         BuildContext context, GoRouterState state) =>
    //     const TransferConfirmationPage();
    // static Widget _historyPageRouteBuilder(
    //         BuildContext context, GoRouterState state) =>
    //     const HistoryPage();
    // static Widget _accountPageRouteBuilder(
    //         BuildContext context, GoRouterState state) =>
    //     const AccountPage();

    // static final GoRouter _router = GoRouter(
    //   routes: <GoRoute>[
    //     GoRoute(path: main, builder: _mainPageRouteBuilder),
    //     GoRoute(path: home, builder: _homePageRouteBuilder),
    //     GoRoute(path: transfer, builder: _transferPageRouteBuilder),
    //     GoRoute(
    //         path: transferConfirmation,
    //         builder: _transferConfirmationPageRouteBuilder),
    //     GoRoute(path: history, builder: _historyPageRouteBuilder),
    //     GoRoute(path: account, builder: _accountPageRouteBuilder),
    //   ],
    //   // errorBuilder: errorWidget,
    // );

    // static GoRouter get router => _router;
  };
}
