import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:login_task/data/contract/auth_contract.dart';
import 'package:login_task/data/repository/auth_repo.dart';
import 'package:login_task/data/service/local/hive_local_service.dart';
import 'package:login_task/data/service/remote/login_service.dart';

final locator = GetIt.instance;
init() async {
  await Hive.initFlutter();
}

setupLocator() async {
  final Box box = await Hive.openBox("auth");
  locator.registerLazySingleton(() => HiveLocalService(box));
  locator.registerLazySingleton(() => LoginService());
  locator.registerLazySingleton<AuthContract>(() => AuthRepo(locator()));
}
