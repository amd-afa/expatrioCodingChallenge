import 'package:auto_route/auto_route.dart';
import 'package:coding_challenge/core/user/models/user.dart';
import 'package:coding_challenge/core/user/models/user_access_token.dart';
import 'package:coding_challenge/core/utilities/dependency_injection/get_it_config.dart';
import 'package:coding_challenge/core/utilities/routers/app_router.dart';
import 'package:coding_challenge/core/utilities/storage/app_secure_storage.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    UserAccesToken? userAccesToken =
        await getIt<AppSecureStorage>().getUserAccessToken();

    User? user = await getIt<AppSecureStorage>().getUserData();

    bool isLoggedIn = (userAccesToken != null)
        ? userAccesToken.accessToken != null &&
            userAccesToken.accessTokenExpiresAt!.isAfter(DateTime.now())
        : false;

    bool isAuthenticated = isLoggedIn == true && user != null;

    if (isAuthenticated) {
      resolver.next(true);
    } else {
      router.replace(const LoginRoute());
    }
  }
}
