import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/shared.dart';
import 'bloc/transfer_bloc.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  final TextEditingController _accDestController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    
  }

  @override
  void dispose() {
    
    super.dispose();
  }
  
  _onTransfer() {
    Navigator.of(context).pushNamed(Routers.transferConfirmation);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TransferBloc, TransferState>(
        listener: ((BuildContext context, TransferState state) {}),
        builder: (BuildContext context, TransferState state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _accDestController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Account Destination',
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _amountController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Amount',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: _onTransfer, child: const Text('Transfer'))
                ],
              ),
            ),
          );
        });
  }
}
