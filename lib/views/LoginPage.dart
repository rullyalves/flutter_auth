import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_auth/blocs/AuthBloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_auth/blocs/AuthState.dart';
import 'package:flutter_auth/blocs/LoginBloc.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthBloc _authBloc;
  LoginBloc _loginBloc;
  StreamSubscription<AuthState> _subscription;

  @override
  void didChangeDependencies() {
    _authBloc = BlocProvider.of<AuthBloc>(context);
    super.didChangeDependencies();
  }

  @override
  void initState() {
    _loginBloc = new LoginBloc();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      print("NOVO FRAME PORRA");
      _subscription ??=
          _loginBloc?.authStateFlux?.listen(_authBloc?.authStateEvent?.add);
    });
    
    super.initState();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _loginBloc?.dispose();
    print("login disposado");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("LOGUE-SE"),
            Text("DESLOGADO"),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              onPressed: _loginBloc.signIn,
              child: Text("LOGAR"),
            ),
          ],
        ),
      ),
    );
  }
}
