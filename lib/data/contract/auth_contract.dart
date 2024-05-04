import 'package:login_task/data/model/login_model.dart';

abstract class AuthContract {
  
  Future<LoginResponse> login(String email, String password);
}
