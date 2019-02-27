import 'package:flutter_auth/blocs/AuthState.dart';
import 'package:flutter_auth/models/User.dart';
import 'package:flutter_auth/services/data/StorageSave.dart';
import 'package:rxdart/rxdart.dart';

class SignInBloc {
  final _storageSave = StorageSave();

  final _authStateController = PublishSubject<AuthState>();
  ValueObservable<AuthState> get authStateFlux => _authStateController.stream;
  Sink<AuthState> get authStateEvent => _authStateController.sink;

  final _userInfoController = BehaviorSubject<User>();
  Observable<User> get userInfoFlux => _userInfoController.stream;
  Sink<User> get userInfoEvent => _userInfoController.sink;
  User get userValue => _userInfoController.value;

  final _emailController = new BehaviorSubject<String>();
  Observable<String> get emailFlux => _emailController.stream;
  Sink<String> get emailEvent => _emailController.sink;
  String get emailValue => _emailController.value;

  final _passwordController = new BehaviorSubject<String>();
  Observable<String> get passwordFlux => _passwordController.stream;
  Sink<String> get passwordEvent => _passwordController.sink;
  String get passwordValue => _passwordController.value;

  Future<void> signIn() async {
    try {
      await _storageSave.writeFile(value: "auth", fileName: "auth");
      authStateEvent.add(Authenticated());
    } catch (e) {
      authStateEvent.add(NotAuthenticated());
    }
  }

  void dispose() {
    _authStateController?.close();
    _userInfoController?.close();
    _emailController?.close();
    _passwordController?.close();
  }
}
