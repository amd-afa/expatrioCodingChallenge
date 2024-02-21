import 'dart:convert';

import 'package:coding_challenge/core/utilities/dependency_injection/get_it_config.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthServices {
  final dio = getIt<Dio>();
  static const baseUrl = 'https://dev-api.expatrio.com';

  Future<Response?> userLogin(String email, String password) async {
    var params = {
      'email': email,
      'password': password,
    };
    Response<dynamic>? response;
    try {
      response = await dio.post(
        '$baseUrl/auth/login',
        data: jsonEncode(params),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': '*/*',
          },
        ),
      );
      return response;
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }
}
