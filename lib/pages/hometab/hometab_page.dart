import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_mockva/pages/account/account_page.dart';
import 'package:flutter_bloc_mockva/pages/history/history_page.dart';
import 'package:flutter_bloc_mockva/pages/home/home_page.dart';
import 'package:flutter_bloc_mockva/pages/transfer/transfer_page.dart';

import 'bloc/hometab_bloc.dart';

class HomeTabPage extends StatefulWidget {
  const HomeTabPage({super.key});

  @override
  State<HomeTabPage> createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage> {
  int _selectedTab = 0;
  String title = 'Home';

  Widget _activeTab(HometabState state, BuildContext context) {
    if (state == HometabState.transfer) {
      return const TransferPage();
    }
    if (state == HometabState.history) {
      return const HistoryPage();
    }
    if (state == HometabState.account) {
      return const AccountPage();
    }

    return const HomePage();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HometabBloc, HometabState>(listener: ((context, state) {
      if (state == HometabState.transfer) {
        title = 'Transfer';
      }
      if (state == HometabState.history) {
        title = 'History Transaction';
      }
      if (state == HometabState.account) {
        title = 'Account';
      }
      if (state == HometabState.home) {
        title = 'Home';
      }
    }), builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          title: Text(title),
        ),
        body: _activeTab(state, context),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedTab,
          selectedItemColor: Colors.blueGrey,
          unselectedItemColor: Colors.black12,
          onTap: (int value) {
            BlocProvider.of<HometabBloc>(context)
                .add(HometabChoose(tab: HometabState.values[value]));
            setState(() {
              _selectedTab = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.send_rounded), label: 'Transfer'),
            BottomNavigationBarItem(
                icon: Icon(Icons.history_rounded), label: 'History'),
            BottomNavigationBarItem(
                icon: Icon(Icons.people_rounded), label: 'Account')
          ],
        ),
      );
    });
  }
}
