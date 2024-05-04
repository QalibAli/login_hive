import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_task/cubit/cubit/auth_state.dart';
import 'package:login_task/ui/pages/home/home_screen.dart';
import 'package:login_task/utils/extensions/rooter.dart';

import '../../../cubit/cubit/auth_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: authCubit.controllers['email'],
            decoration: const InputDecoration(
              hintText: "email",
            ),
          ),
          TextFormField(
            controller: authCubit.controllers['password'],
            decoration: const InputDecoration(
              hintText: "password",
            ),
          ),
          BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthLoading) {
                log("Auth Loading");
              } else if (state is AuthSuccses) {
                context.go(const HomeScreen());
              } else if (state is AuthError) {
                log("Auth error");
              }
            },
            child: ElevatedButton(
              onPressed: () {
                authCubit.login();
              },
              child: const Text("Login"),
            ),
          )
        ],
      ),
    );
  }
}
