import 'package:coding_challenge/core/user/models/user.dart';
import 'package:coding_challenge/core/user/models/user_access_token.dart';
import 'package:coding_challenge/core/utilities/dependency_injection/get_it_config.dart';
import 'package:coding_challenge/core/utilities/storage/app_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_state_provider.g.dart';

class UserStateProviderModel {
  final User? user;
  final UserAccesToken? userAccesToken;
  const UserStateProviderModel({
    this.user,
    this.userAccesToken,
  });

  UserStateProviderModel copyWith({
    User? user,
    UserAccesToken? userAccesToken,
  }) {
    return UserStateProviderModel(
      user: user ?? this.user,
      userAccesToken: userAccesToken ?? this.userAccesToken,
    );
  }
}

@Riverpod(keepAlive: true)
class UserStateProvider extends _$UserStateProvider {
  @override
  UserStateProviderModel build() {
    init();
    return const UserStateProviderModel();
  }

  void updateState(UserStateProviderModel newState) {
    state = newState;
  }

  Future<void> init() async {
    final userAccesToken = await getIt<AppSecureStorage>().getUserAccessToken();
    final user = await getIt<AppSecureStorage>().getUserData();
    updateState(state.copyWith(user: user, userAccesToken: userAccesToken));
  }

  Future<void> setUserAccesToken(UserAccesToken userAccesToken) async {
    await getIt<AppSecureStorage>().setUserAccessToken(userAccesToken);
    updateState(state.copyWith(userAccesToken: userAccesToken));
  }

  Future<void> setUserData(User user) async {
    await getIt<AppSecureStorage>().setUserData(user);
    updateState(state.copyWith(user: user));
  }
}
