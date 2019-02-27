
import 'package:flutter/material.dart';
import 'package:flutter_auth/blocs/AuthBloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_auth/views/RootPage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget b() {
    return Container(
      height: 100,
      color: Colors.red,
      margin: const EdgeInsets.only(top: 25, left: 15, right: 15),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, right: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 9, left: 9),
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.account_box,
                    size: 35,
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Texto Esquerda"),
                      Text("Texto Direita")
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                                "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                                "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.",
                            softWrap: true,
                            textAlign: TextAlign.start,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      bloc: AuthBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: RootPage(),
      ),
    );
  }
}
