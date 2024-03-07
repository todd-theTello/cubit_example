import 'package:cubit_example/src/core/states/authentication/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final AuthenticationCubit auth;
  bool isLoading = false;
  final username = TextEditingController();
  final password = TextEditingController();

  @override
  void initState() {
    auth = BlocProvider.of<AuthenticationCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: BlocConsumer(
        bloc: auth,
        listener: (context, state) {
          if (state is AuthenticationLoading) {
            isLoading = true;
          } else {
            isLoading = false;
          }
          if (state is AuthenticationError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(state.message),
              ),
            );
          }
          if (state is AuthenticationSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.green,
                content: Text('Login successful'),
              ),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: username,
                  decoration: InputDecoration(hintText: 'Enter username'),
                ),
                TextField(
                  controller: password,
                  decoration: InputDecoration(hintText: 'Enter password'),
                ),
                SizedBox(height: 20),
                FilledButton(
                  onPressed: () async {
                    auth.login(username: username.text, password: password.text);
                  },
                  child: Text('data'),
                ),
                if (isLoading) CircularProgressIndicator.adaptive(),
              ],
            ),
          );
        },
      ),
    );
  }
}
