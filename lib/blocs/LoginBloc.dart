import 'package:flutter_auth/blocs/AuthState.dart';
import 'package:flutter_auth/services/data/StorageSave.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc {
  final _storageSave = StorageSave();
  final _authStateController = PublishSubject<AuthState>();

  Observable<AuthState> get authStateFlux => _authStateController.stream;
  Sink<AuthState> get authStateEvent => _authStateController.sink;

  Future<void> signIn() async {
    // loading();
    try {
      await _storageSave.writeFile(value: "auth", fileName: "auth");
      authStateEvent.add(Authenticated());
    } catch (e) {
      authStateEvent.add(NotAuthenticated());
    }
  }

  void dispose() {
    _authStateController?.close();
  }
}
