import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import '../../../models/models.dart';
import '../../../shared/shared.dart';
import 'bloc/receipt_transfer_bloc.dart';

class ReceiptTransferPage extends StatefulWidget {
  final TransferResponseModel model;
  final TransferInquiryResponseModel data;
  const ReceiptTransferPage(
      {super.key, required this.model, required this.data});

  @override
  State<ReceiptTransferPage> createState() => _ReceiptTransferPageState();
}

class _ReceiptTransferPageState extends State<ReceiptTransferPage> {
  ScreenshotController screenshotController = ScreenshotController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _onShare() async {
    await screenshotController.capture().then((Uint8List? image) async {
      if (image != null) {
        final directory = await getApplicationDocumentsDirectory();
        final imagePath = await File('${directory.path}/image.png').create();
        debugPrint(imagePath.toString());
        await imagePath.writeAsBytes(image);
        await Share.shareXFiles([XFile(imagePath.path)]);
      }
    });
  }

  _onClose() {
    Navigator.of(context).popUntil(ModalRoute.withName(Routers.home));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReceiptTransferBloc, ReceiptTransferState>(
        listener: ((context, state) {}),
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              shadowColor: Colors.transparent,
              leading: IconButton(
                icon: const Icon(
                  Icons.close_rounded,
                  color: Colors.black26,
                ),
                onPressed: _onClose,
              ),
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.send_rounded,
                    color: Colors.black26,
                  ),
                  onPressed: _onShare,
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(25),
              child: Screenshot(
                controller: screenshotController,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  height: 600,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black12,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Center(
                        child: Text(
                          'Receipt Transaction',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          const Expanded(
                            flex: 30,
                            child: Text(
                              'Account Source',
                            ),
                          ),
                          const Expanded(
                            flex: 2,
                            child: Text(
                              ':',
                            ),
                          ),
                          Expanded(
                            flex: 30,
                            child: Text(
                              widget.model.accountSrcId!,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Expanded(
                            flex: 30,
                            child: Text(
                              'Account Source Name',
                            ),
                          ),
                          const Expanded(
                            flex: 2,
                            child: Text(
                              ':',
                            ),
                          ),
                          Expanded(
                            flex: 30,
                            child: Text(
                              widget.data.accountSrcName!,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Expanded(
                            flex: 30,
                            child: Text(
                              'Account Destination',
                            ),
                          ),
                          const Expanded(
                            flex: 2,
                            child: Text(
                              ':',
                            ),
                          ),
                          Expanded(
                            flex: 30,
                            child: Text(
                              widget.model.accountDstId!,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Expanded(
                            flex: 30,
                            child: Text(
                              'Account Destination Name',
                            ),
                          ),
                          const Expanded(
                            flex: 2,
                            child: Text(
                              ':',
                            ),
                          ),
                          Expanded(
                            flex: 30,
                            child: Text(
                              widget.data.accountDstName!,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Expanded(
                            flex: 30,
                            child: Text(
                              'Ammount ',
                            ),
                          ),
                          const Expanded(
                            flex: 2,
                            child: Text(
                              ':',
                            ),
                          ),
                          Expanded(
                            flex: 30,
                            child: Text(
                              widget.model.amount.toString(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Expanded(
                            flex: 30,
                            child: Text(
                              'Reference Number',
                            ),
                          ),
                          const Expanded(
                            flex: 2,
                            child: Text(
                              ':',
                            ),
                          ),
                          Expanded(
                            flex: 30,
                            child: Text(
                              widget.model.clientRef!,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Expanded(
                            flex: 30,
                            child: Text(
                              'Transaction Timestamp',
                            ),
                          ),
                          const Expanded(
                            flex: 2,
                            child: Text(
                              ':',
                            ),
                          ),
                          Expanded(
                            flex: 30,
                            child: Text(
                              widget.model.transactionTimestamp.toString(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Expanded(
                            flex: 30,
                            child: Text(
                              'Status',
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              ':',
                            ),
                          ),
                          Expanded(
                            flex: 30,
                            child: Text(
                              'Success',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
