import 'package:ecume/bloc/login_bloc/login_bloc.dart';
import 'package:ecume/controller/controllers.dart';
import 'package:ecume/views/recoverPwd_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  final UserRepository userRepository;
  LoginForm({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState(userRepository);
}

class _LoginFormState extends State<LoginForm> {
  final UserRepository userRepository;
  _LoginFormState(this.userRepository);
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool hidePassword = true;

  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(
        LoginButtonPressed(
          email: _usernameController.text,
          password: _passwordController.text,
        ),
      );
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          _showMyDialog();
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).accentColor,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(vertical: 33, horizontal: 20),
                      margin:
                          EdgeInsets.symmetric(vertical: 85, horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(context).primaryColor,
                          boxShadow: [
                            BoxShadow(
                                color: Theme.of(context)
                                    .hintColor
                                    .withOpacity(0.2),
                                offset: Offset(0, 10),
                                blurRadius: 20)
                          ]),
                      child: Form(
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 20),
                            Text(
                              "ECUME",
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            SizedBox(height: 10),
                            Text(
                              "¡Hola, hagamos ejercicio!",
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            SizedBox(height: 25),
                            new TextFormField(
                              controller: _usernameController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (input) => !input.contains("@")
                                  ? "Debe introducir un correo valido."
                                  : null,
                              decoration: new InputDecoration(
                                hintText: "Correo electronico",
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .accentColor
                                        .withOpacity(0.2),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Theme.of(context).accentColor,
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              controller: _passwordController,
                              keyboardType: TextInputType.text,
                              validator: (input) => input.length < 3
                                  ? "La contraseña debe tener más de 3 caracteres"
                                  : null,
                              obscureText: hidePassword,
                              decoration: new InputDecoration(
                                hintText: "Contraseña",
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .accentColor
                                        .withOpacity(0.2),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Theme.of(context).accentColor,
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Theme.of(context).accentColor,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      hidePassword = !hidePassword;
                                    });
                                  },
                                  color: Theme.of(context)
                                      .accentColor
                                      .withOpacity(0.5),
                                  icon: Icon(
                                    hidePassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 12),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RecoverPwdView()),
                                );
                              },
                              child: Text("Olvide mi contraseña"),
                            ),
                            SizedBox(height: 30),
                            RaisedButton(
                              padding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 80),
                              onPressed: _onLoginButtonPressed,
                              child: Text(
                                "Iniciar sesión",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              color: Theme.of(context).accentColor,
                              shape: StadiumBorder(),
                            ),
                            SizedBox(height: 25),
                            RaisedButton(
                              padding: EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 50,
                              ),
                              onPressed: () {
                                //accion a registrarse
                              },
                              child: Text(
                                "Registrarse",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              color: Color.fromRGBO(121, 172, 33, 1),
                              shape: StadiumBorder(),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Lo sentimos'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('El correo electrónico o contraseña'),
                Text('son incorectos, intente de nuevo.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
