import 'package:login_task/data/contract/auth_contract.dart';
import 'package:login_task/data/model/login_model.dart';

import '../service/remote/login_service.dart';

class AuthRepo implements AuthContract {
  AuthRepo(this._loginService);

  final LoginService _loginService;

  @override
  Future<LoginResponse> login(String email, String password) {
    return _loginService.login(email, password);
  }
}

// void main(List<String> args) {
//   List<String> x = ["1"];
// }