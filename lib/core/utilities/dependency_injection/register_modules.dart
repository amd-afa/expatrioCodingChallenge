import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();
  Dio get dio => Dio();
}
