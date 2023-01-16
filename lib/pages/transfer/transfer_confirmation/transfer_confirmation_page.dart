import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/transfer_confimration_bloc.dart';

class TransferConfirmationPage extends StatefulWidget {
  const TransferConfirmationPage({super.key});

  @override
  State<TransferConfirmationPage> createState() =>
      _TransferConfirmationPageState();
}

class _TransferConfirmationPageState extends State<TransferConfirmationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TransferConfimrationBloc, TransferConfimrationState>(
        listener: ((context, state) {}),
        builder: (context, state) {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('TransferConfimration Page'),
                ElevatedButton(
                    // onPressed: () {
                    //   _authBloc.add(LoggedOut());
                    // },
                    onPressed: () {},
                    child: const Text('gotohome'))
              ],
            ),
          );
        });
  }
}
