import 'package:flutter/material.dart';
import 'package:flutter_auth/blocs/AuthBloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_auth/blocs/AuthState.dart';
import 'package:flutter_auth/views/HomePage.dart';
import 'package:flutter_auth/views/LoginPage.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  AuthBloc _authBloc;

  @override
  void didChangeDependencies() {
    _authBloc = BlocProvider.of<AuthBloc>(context);
    super.didChangeDependencies();
  }

  void show() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            child: Text("TEBLITO"),
          ),
        );
      },
    );
  }

  Widget _buildItems(AuthState authState) {
    if (authState is Authenticated) {
      return HomePage();
    } else if (authState is Loading) {
      return Scaffold();
    } else if (authState is NotAuthenticated) {
      return LoginPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AuthState>(
      initialData: _authBloc.authStateValue,
      stream: _authBloc.authStateFlux,
      builder: (BuildContext context, AsyncSnapshot<AuthState> snapshot) =>
          _buildItems(snapshot.data),
    );
  }
}
