import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';

final dio = Dio()..interceptors.add(AwesomeDioInterceptor());