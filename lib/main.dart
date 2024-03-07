import 'package:cubit_example/src/core/states/authentication/authentication_cubit.dart';
import 'package:cubit_example/src/ui/views/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/ui/views/home.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<AuthenticationCubit>(create: (context) => AuthenticationCubit()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AuthSwitch(),
    );
  }
}

class AuthSwitch extends StatefulWidget {
  const AuthSwitch({super.key});

  @override
  State<AuthSwitch> createState() => _AuthSwitchState();
}

class _AuthSwitchState extends State<AuthSwitch> {
  late final AuthenticationCubit auth;

  @override
  void initState() {
    auth = BlocProvider.of<AuthenticationCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
        bloc: auth,
        builder: (context, state) {
          print(state.toString());
          return switch (state) {
            AuthenticationSuccess() => const HomeView(),
            _ => LoginView(),
          };
        });
  }
}
