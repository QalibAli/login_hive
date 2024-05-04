import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_task/cubit/cubit/auth_cubit.dart';
import 'package:login_task/data/service/local/hive_local_service.dart';
import 'package:login_task/ui/pages/home/home_screen.dart';
import 'package:login_task/ui/pages/login/login_screen.dart';
import 'package:login_task/utils/di/locator.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final int data = locator<HiveLocalService>().getData;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: data == 1
          ? const HomeScreen()
          : BlocProvider(
              create: (context) => AuthCubit(locator()),
              child: const LoginScreen(),
            ),
    );
  }
}
