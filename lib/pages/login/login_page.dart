import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_mockva/pages/login/bloc/login_bloc.dart';
import 'package:flutter_bloc_mockva/shared/authentication/authentication_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  AuthenticationBloc? _authBloc;
  LoginBloc? _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<LoginBloc>(context);
    _authBloc = BlocProvider.of<AuthenticationBloc>(context);
  }

  _enterToHome() async {
    // _bloc!.add(const SignInEvent(username: 'USER050921', password: '5m19gos'));
    _authBloc!.add(LoggedIn());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: ((context, state) {
        if (state is SignInSuccess) {
          _authBloc!.add(LoggedIn());
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
                  controller: _usernameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.abc),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Username',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  obscuringCharacter: '*',
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Password',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: _enterToHome,
                    child: const Text('Sign In'))
              ],
            ),
          ),
        );
      },
    );
  }
}
