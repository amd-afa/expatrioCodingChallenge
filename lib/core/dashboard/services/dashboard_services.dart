import 'package:coding_challenge/core/dashboard/models/tax/user_tax_data.dart';
import 'package:coding_challenge/core/utilities/dependency_injection/get_it_config.dart';
import 'package:coding_challenge/core/utilities/storage/app_secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DashboardServices {
  final dio = getIt<Dio>();
  static const baseUrl = 'https://dev-api.expatrio.com';

  Future<Response?> getUserTaxData() async {
    final userAccessToken =
        await getIt<AppSecureStorage>().getUserAccessToken();
    final userData = await getIt<AppSecureStorage>().getUserData();
    Response<dynamic>? response;
    try {
      response = await dio.get(
        '$baseUrl/v3/customers/${userData!.userId}/tax-data',
        options: Options(
          headers: {
            'Accept': '*/*',
            'Authorization': userAccessToken!.accessToken,
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

  Future<int?> updateUserTaxData(UserTaxData userTaxData) async {
    final userAccessToken =
        await getIt<AppSecureStorage>().getUserAccessToken();
    final userData = await getIt<AppSecureStorage>().getUserData();
    Response<dynamic>? response;
    try {
      final Map<String, dynamic> requestData = {
        'usPerson': userTaxData.usPerson,
        'usTaxId': userTaxData.usTaxId,
        'primaryTaxResidence': {
          'country': userTaxData.primaryTaxResidence.country,
          'id': userTaxData.primaryTaxResidence.id,
        },
        'secondaryTaxResidence': userTaxData.secondaryTaxResidence
            .map((taxResidence) => {
                  'country': taxResidence.country,
                  'id': taxResidence.id,
                })
            .toList(),
        'w9FileId': userTaxData.w9FileId,
      };

      response = await dio.put(
        '$baseUrl/v3/customers/${userData!.userId}/tax-data',
        data: requestData,
        options: Options(
          headers: {
            'Accept': '*/*',
            'Authorization': userAccessToken!.accessToken,
          },
        ),
      );
      return response.statusCode;
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return response!.statusCode;
  }
}
