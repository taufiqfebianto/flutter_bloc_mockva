import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_mockva/models/transfer_inquiry_response_model.dart';
import 'package:flutter_bloc_mockva/models/transfer_request_model.dart';

import '../../../shared/shared.dart';
import 'bloc/transfer_confimration_bloc.dart';

class TransferConfirmationPage extends StatefulWidget {
  final TransferInquiryResponseModel model;
  const TransferConfirmationPage({super.key, required this.model});

  @override
  State<TransferConfirmationPage> createState() =>
      _TransferConfirmationPageState();
}

class _TransferConfirmationPageState extends State<TransferConfirmationPage> {
  TransferConfimrationBloc? bloc;
  final TransferRequestModel _model = TransferRequestModel();

  final TextEditingController _accSrcController = TextEditingController();
  final TextEditingController _accSrcNameController = TextEditingController();
  final TextEditingController _accDestController = TextEditingController();
  final TextEditingController _accDestNameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  void initState() {
    super.initState();

    bloc = BlocProvider.of<TransferConfimrationBloc>(context);

    _accSrcController.text = widget.model.accountSrcId!;
    _accSrcNameController.text = widget.model.accountSrcName!;
    _accDestController.text = widget.model.accountDstId!;
    _accDestNameController.text = widget.model.accountDstName!;
    _amountController.text = widget.model.amount!.toString();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _onConfirm() async {
    _model.accountSrcId = widget.model.accountSrcId;
    _model.accountDstId = widget.model.accountDstId;
    _model.amount = widget.model.amount;
    _model.inquiryId = widget.model.inquiryId;
    bloc!.add(TransferConfirmationEvent(_model));
  }

  _onClose() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TransferConfimrationBloc, TransferConfimrationState>(
        listener: ((BuildContext context, TransferConfimrationState state) {
      if (state is TransferConfirmationSuccessState) {
        Navigator.of(context)
            .pushNamed(Routers.receiptTransfer, arguments: [state.model,widget.model]);
      }
    }), builder: (BuildContext context, TransferConfimrationState state) {
      return Scaffold(
        appBar: AppBar(
          leading: Container(),
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
                onPressed: _onClose,
                icon: const Icon(
                  Icons.close_rounded,
                  color: Colors.blueAccent,
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _accSrcController,
                enabled: false,
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
                enabled: false,
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
                enabled: false,
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
                enabled: false,
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
                enabled: false,
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
                  onPressed: _onConfirm, child: const Text('Confirm'))
            ],
          ),
        ),
      );
    });
  }
}
