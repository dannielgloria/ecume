import 'package:ecume/bloc/auth_bloc/auth.dart';
import 'package:ecume/bloc/login_bloc/login_bloc.dart';
import 'package:ecume/controller/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_form.dart';

class LoginView extends StatelessWidget {
  final UserRepository userRepository;

  LoginView({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            userRepository: userRepository,
          );
        },
        child: LoginForm(
          userRepository: userRepository,
        ),
      ),
    );
  }
}
