import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_mockva/shared/shared.dart';

import '../../models/models.dart';
import 'bloc/transfer_bloc.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  TransferBloc? bloc;
  TransferInquiryRequestModel model = TransferInquiryRequestModel();
  String accountId = '';
  final TextEditingController _accDestController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<TransferBloc>(context);
    _accDestController.text = '8260200409103259';
    _amountController.text = '1';
  }

  @override
  void dispose() {
    super.dispose();
  }

  _onTransfer() async {
    model.accountSrcId = await storage.getString(
        boxName: describeEnum(StorageConstants.user), key: 'accountId');
    model.accountDstId = _accDestController.text;
    model.amount = double.parse(_amountController.text);

    bloc!.add(TransferInquiryEvent(model));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TransferBloc, TransferState>(
        listener: ((BuildContext context, TransferState state) {
      if (state is TransferInquirySuccessState) {
        Navigator.of(context).pushNamed(Routers.transferConfirmation,arguments: state.model);
      }
    }), builder: (BuildContext context, TransferState state) {
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
                  labelText: 'Account Destination',
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
                  labelText: 'Amount',
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
