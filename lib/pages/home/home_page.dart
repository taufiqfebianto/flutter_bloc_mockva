import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_mockva/models/detail_account_response_model.dart';

import 'bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController _accSrcController = TextEditingController();
  final TextEditingController _accNameController = TextEditingController();
  final TextEditingController _balanceController = TextEditingController();

  HomeBloc? bloc;
  late DetailAccountResponseModel _model = DetailAccountResponseModel();

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<HomeBloc>(context);
    bloc!.add(GetAccountDetailEvent());
    // loadData();
  }

  loadData() {
    // bloc!.add(GetAccountDetailEvent());
    _accSrcController.text = _model.id!;
    _accNameController.text = _model.name!;
    _balanceController.text = _model.balance!.toString();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: ((context, state) {
        if (state is GetAccountDetailSuccess) {
          _model = state.model;
          //  state.model.id;
          loadData();
        }
      }),
      builder: (context, state) {
        return Scaffold(
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
                    labelText: 'Account Number',
                    
                  ),
                  
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _accNameController,
                  enabled: false,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Account Name',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _balanceController,
                  enabled: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Balance',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
