import 'package:flutter/foundation.dart';
import 'package:yachaywai/src/domain/entities/usuario.dart';
import 'package:yachaywai/src/domain/usecases/log_in_use_case.dart';

class LoginProvider extends ChangeNotifier {
  final LoginUseCase _loginUseCase;
  LoginProvider(this._loginUseCase);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Usuario? _usuario;
  Usuario? get usuario => _usuario;

  Future<void> logIn(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    _usuario = await _loginUseCase(
      email: email,
      password: password,
    );

    _isLoading = false;
    notifyListeners();
  }
}
