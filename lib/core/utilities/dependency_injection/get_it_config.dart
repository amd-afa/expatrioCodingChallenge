import 'package:coding_challenge/core/utilities/dependency_injection/get_it_config.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'initDependencyInjection',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configureDependencies() async => initDependencyInjection(getIt);
