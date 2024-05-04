
import 'package:login_task/data/model/login_model.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class AuthSuccses extends AuthState {
  final LoginResponse loginResponse;

  AuthSuccses(this.loginResponse);
}


final class AuthLoading extends AuthState {}
final class AuthError extends AuthState {}
final class AuthNetworkFail extends AuthState {
  
}
