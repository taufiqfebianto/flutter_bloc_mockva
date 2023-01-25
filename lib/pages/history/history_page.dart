import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/models.dart';
import 'bloc/history_bloc.dart';

class HistoryPage extends StatefulWidget {
  final HistoryTransactionResponseModel? model;
  const HistoryPage({super.key, this.model});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  HistoryBloc? bloc;
  late HistoryTransactionResponseModel model =
      HistoryTransactionResponseModel();

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<HistoryBloc>(context);
    bloc!.add(GetHistoryTransactionEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HistoryBloc, HistoryState>(listener: ((context, state) {
      if (state is GetHistoryTransactionSuccessState) {
        debugPrint(state.toString());
      }
    }), builder: (context, state) {
      return Scaffold(
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ListView.builder(
                padding: const EdgeInsets.only(top: 25),
                itemCount: 10,
                itemBuilder: ((context, index) {
                  return Column(
                    children: [
                      Row(
                        children: const [
                          Expanded(
                            flex: 30,
                            child: Text(
                              'Account Source',
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Text(
                              ':',
                            ),
                          ),
                          Expanded(
                            flex: 30,
                            child: Text(
                              'widget.model.accountSrcId',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Expanded(
                            flex: 30,
                            child: Text(
                              'Amount',
                            ),
                          ),
                          Expanded(
                            flex: 5,
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
                              'Account Destination',
                            ),
                          ),
                          Expanded(
                            flex: 5,
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
                              'Reference Number',
                            ),
                          ),
                          Expanded(
                            flex: 5,
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
                              'Date',
                            ),
                          ),
                          Expanded(
                            flex: 5,
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
                      const Divider()
                    ],
                  );
                }))),
      );
    });
  }
}
