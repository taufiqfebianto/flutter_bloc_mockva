import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/transfer_bloc.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TransferBloc, TransferState>(
        listener: ((context, state) {}),
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Transfer Page'),
                  ElevatedButton(
                      // onPressed: () {
                      //   _authBloc.add(LoggedOut());
                      // },
                      onPressed: () {},
                      child: const Text('gotohome'))
                ],
              ),
            ),
          );
        });
  }
}
