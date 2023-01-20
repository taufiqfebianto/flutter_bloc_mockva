import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import '../../../models/models.dart';
import 'bloc/receipt_transfer_bloc.dart';

class ReceiptTransferPage extends StatefulWidget {
  final TransferResponseModel? model;
  const ReceiptTransferPage({super.key, this.model});

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
  
    await screenshotController
        .capture()
        .then((Uint8List? image) async {
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
    Navigator.of(context).pop();
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
                    color: Colors.black12,
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
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: const [
                          Expanded(
                            flex: 30,
                            child: Text(
                              'Account Source',
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
                              ' widget.model.accountSrcId',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Expanded(
                            flex: 30,
                            child: Text(
                              'Account Source Name',
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
                              'widget.model.accountSrcName',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Expanded(
                            flex: 30,
                            child: Text(
                              'Account Destination',
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
                              'widget.model.accountDstId',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Expanded(
                            flex: 30,
                            child: Text(
                              'Account Destination Name',
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
                              'widget.model.accountDstName',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Expanded(
                            flex: 30,
                            child: Text(
                              'Ammount ',
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
                              'widget.model.amount',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Expanded(
                            flex: 30,
                            child: Text(
                              'Reference Number',
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
                              'widget.model.clientRef',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Expanded(
                            flex: 30,
                            child: Text(
                              'Transaction Timestamp',
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
                              'widget.model.transactionTimestamp',
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
                              'VALUE',
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
