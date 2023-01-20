import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_mockva/shared/authentication/authentication_bloc.dart';

import '../../shared/shared.dart';
import 'bloc/account_bloc.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  AccountBloc? _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of<AccountBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _onSignOut() {
    _bloc!.add(SignOutEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountBloc, AccountState>(listener: ((context, state) {
      if (state is SignOutSuccessState) {
        storage.deleteData(boxName: describeEnum(StorageConstants.user));
        BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
      }
    }), builder: (context, state) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                  onPressed: _onSignOut, child: const Text('Sign Out'))
            ],
          ),
        ),
      );
    });
  }
}
