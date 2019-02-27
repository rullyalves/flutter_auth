
import 'package:flutter/material.dart';
import 'package:flutter_auth/blocs/AuthBloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthBloc _authBloc;
  @override
  void didChangeDependencies() {
    _authBloc = BlocProvider.of<AuthBloc>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Página Inicial',
            ),
            Text(
              'LOGADO',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _authBloc.signOut,
        tooltip: 'SAIR',
        child: Text("SAIR"),
      ),
    );
  }
}
