import 'package:flutter/material.dart';
import 'package:login_task/app.dart';
import 'package:login_task/utils/di/locator.dart';

void main() async {
  await init();
  await setupLocator();

  runApp(const MyApp());
}
