// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i6;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../dashboard/services/dashboard_services.dart' as _i5;
import '../../user/services/auth_services.dart' as _i4;
import '../storage/app_secure_storage.dart' as _i3;
import 'register_modules.dart' as _i8;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt initDependencyInjection(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.AppSecureStorage>(() => _i3.AppSecureStorage());
  gh.lazySingleton<_i4.AuthServices>(() => _i4.AuthServices());
  gh.lazySingleton<_i5.DashboardServices>(() => _i5.DashboardServices());
  gh.factory<_i6.Dio>(() => registerModule.dio);
  gh.factory<_i7.FlutterSecureStorage>(() => registerModule.secureStorage);
  return getIt;
}

class _$RegisterModule extends _i8.RegisterModule {}
