import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/shared.dart';
import 'bloc/transfer_confimration_bloc.dart';

class TransferConfirmationPage extends StatefulWidget {
  const TransferConfirmationPage({super.key});

  @override
  State<TransferConfirmationPage> createState() =>
      _TransferConfirmationPageState();
}

class _TransferConfirmationPageState extends State<TransferConfirmationPage> {
  late TransferConfimrationBloc _bloc;
  final TextEditingController _accSrcController = TextEditingController();
  final TextEditingController _accSrcNameController = TextEditingController();
  final TextEditingController _accDestController = TextEditingController();
  final TextEditingController _accDestNameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _accSrcController.text = 'cek';
    _bloc = BlocProvider.of<TransferConfimrationBloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  _onConfirm() {}

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TransferConfimrationBloc, TransferConfimrationState>(
        listener: ((BuildContext context, TransferConfimrationState state) {}),
        builder: (BuildContext context, TransferConfimrationState state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: _accSrcController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: 'Account Source',
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _accSrcNameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: 'Account Source Name',
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _accDestController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: 'Account Destination',
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _accDestNameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: 'Account Destination Name'),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: 'Amount',
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(Routers.receiptTransfer);
                      },
                      child: const Text('Confirm'))
                ],
              ),
            ),
          );
        });
  }
}
