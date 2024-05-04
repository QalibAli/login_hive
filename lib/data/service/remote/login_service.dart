
import 'dart:io';

import 'package:login_task/constants/endpoints.dart';
import 'package:login_task/data/model/login_model.dart';
import 'package:login_task/utils/network/dio.dart';

class LoginService {
  
  Future<LoginResponse> login(
    String email,
    String password
  ) async{
    try {
      final data = {
      "email" :email,
      "password":password,
    };
    const endpoint = EndPoints.login;
    final response = await dio.post(endpoint,data: data);
    if (response.statusCode == 201) {
      return LoginResponse.fromJson(response.data);
    }
    throw Exception();
    } on SocketException catch(e){
      throw Exception();
    }
    catch (e) {
      throw Exception();
    }
  }
}