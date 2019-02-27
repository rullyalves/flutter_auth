import 'package:flutter_auth/blocs/AuthState.dart';
import 'package:flutter_auth/models/User.dart';
import 'package:flutter_auth/services/data/StorageSave.dart';
import 'package:rxdart/rxdart.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class AuthBloc extends BlocBase {
  final _storageSave = StorageSave();

  final _authStateController = BehaviorSubject<AuthState>.seeded(Loading());

  ValueObservable<AuthState> get authStateFlux => _authStateController.stream;
  Sink<AuthState> get authStateEvent => _authStateController.sink;
  AuthState get authStateValue => _authStateController.value;

  final _userInfoController = new BehaviorSubject<User>();
  ValueObservable<User> get userInfoFlux => _userInfoController.stream;
  Sink<User> get userInfoEvent => _userInfoController.sink;
  User get userInfoValue => _userInfoController.value;

  AuthBloc() {
    initialAuth();
    authStateFlux.listen((v) {
      print("ESTADO DA AUTENTICAÇÃO:${v}");
    });
  }

  Future<void> initialAuth() async {
    // loading();
    try {
      await _storageSave.readFile("auth");
      authStateEvent.add(Authenticated());
    } catch (e) {
      print(e);
      authStateEvent.add(NotAuthenticated());
    }
  }

  Future<void> signOut() async {
    //  loading();
    try {
      await _storageSave.deleteFile("auth");
      authStateEvent.add(NotAuthenticated());
    } catch (e) {
      authStateEvent.add(Error());
    }
  }

  void loading() {
    _authStateController.add(Loading());
  }

  @override
  void dispose() {
    _authStateController.close();
    _userInfoController.close();
  }
}
