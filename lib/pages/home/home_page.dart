import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_mockva/shared/shared.dart';

import 'bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  _logOut() async {
    // String A = '';
    storage.deleteData(boxName: describeEnum(StorageConstants.user));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: ((context, state) {}),
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('Home Page'),
                ElevatedButton(
                    // onPressed: () {
                    //   _authBloc.add(LoggedOut());
                    // },
                    onPressed: _logOut,
                    child: const Text('gotologin'))
              ],
            ),
          ),
        );
      },
    );
  }
}
