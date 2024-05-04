import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_task/cubit/cubit/auth_state.dart';
import 'package:login_task/data/model/login_model.dart';
import 'package:login_task/data/service/local/hive_local_service.dart';
import 'package:login_task/data/service/remote/login_service.dart';
import 'package:login_task/utils/di/locator.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    this._loginService,
  ) : super(AuthInitial());

  final LoginService _loginService;

  final controllers = {
    'email': TextEditingController(),
    'password': TextEditingController(),
  };

  void login() async {
    try {
      emit(AuthLoading());
      final result = await _loginService.login(
          controllers['email']!.text, controllers['password']!.text);
      saveState();
      emit(AuthSuccses(result));
    } on SocketException catch (e) {
      emit(AuthNetworkFail());
    } catch (e) {
      emit(AuthError());
    }
  }

  void saveState() async {
    final hive = locator<HiveLocalService>();
    await hive.saveState();
  }

  @override
  Future<void> close() {
    for (var element in controllers.values) {
      element.dispose();
    }
    return super.close();
  }
}
