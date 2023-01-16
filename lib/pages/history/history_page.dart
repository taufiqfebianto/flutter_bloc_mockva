import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/history_bloc.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
 @override
  Widget build(BuildContext context) {
    return BlocConsumer<HistoryBloc, HistoryState>(
        listener: ((context, state) {}),
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('History Page'),
                  ElevatedButton(
                      // onPressed: () {
                      //   _authBloc.add(LoggedOut());
                      // },
                      onPressed: (){},
                      child: const Text('gotohome'))
                ],
              ),
            ),
          );
        });
  }
}
