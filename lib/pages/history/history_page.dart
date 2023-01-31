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

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16.0,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        behavior: SnackBarBehavior.floating,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HistoryBloc, HistoryState>(listener: ((context, state) {
      if (state is GetHistoryTransactionSuccessState) {}
      if (state is FailedState) {
        _showSnackBar(state.message!);
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
