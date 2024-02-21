import 'package:coding_challenge/core/user/models/user.dart';
import 'package:coding_challenge/core/user/models/user_access_token.dart';
import 'package:coding_challenge/core/user/services/auth_services.dart';
import 'package:coding_challenge/core/user/state/user_state_provider.dart';
import 'package:coding_challenge/core/utilities/dependency_injection/get_it_config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_state_view.g.dart';

class LoginScreenViewModel {
  final bool obscureTextActiv;
  final bool isLoading;
  final bool? loggedInSuccessfully;

  LoginScreenViewModel({
    required this.obscureTextActiv,
    required this.isLoading,
    this.loggedInSuccessfully,
  });

  LoginScreenViewModel copyWith({
    bool? obscureTextActiv,
    bool? isLoading,
    bool? loggedInSuccessfully,
  }) {
    return LoginScreenViewModel(
      obscureTextActiv: obscureTextActiv ?? this.obscureTextActiv,
      isLoading: isLoading ?? this.isLoading,
      loggedInSuccessfully: loggedInSuccessfully ?? this.loggedInSuccessfully,
    );
  }
}

@riverpod
class LoginScreenViewState extends _$LoginScreenViewState {
  @override
  LoginScreenViewModel build() {
    return LoginScreenViewModel(
      obscureTextActiv: false,
      isLoading: false,
    );
  }

  void updateState(LoginScreenViewModel newState) {
    state = newState;
  }

  void updateObscureTextStatus(bool activ) async {
    updateState(
      state.copyWith(
        obscureTextActiv: activ,
      ),
    );
  }

  Future<void> userLogin(String email, String password) async {
    updateState(
      state.copyWith(
        isLoading: true,
      ),
    );
    await getIt<AuthServices>()
        .userLogin(email, password)
        .then((response) async {
      //TODO: more detailed error handling for the login process
      if (response != null) {
        if (response.data != null && response.statusCode == 200) {
          try {
            final userData = User.fromJson(response.data['subject']);
            await ref
                .read(userStateProviderProvider.notifier)
                .setUserData(userData);

            final accessTokenData = {
              'accessToken': response.data['accessToken'],
              'accessTokenExpiresAt': response.data['accessTokenExpiresAt'],
            };
            final accessToken = UserAccesToken.fromJson(accessTokenData);
            await ref
                .read(userStateProviderProvider.notifier)
                .setUserAccesToken(accessToken);
            updateState(
              state.copyWith(
                loggedInSuccessfully: true,
                isLoading: false,
              ),
            );
          } catch (e) {
            updateState(
              state.copyWith(
                isLoading: false,
                loggedInSuccessfully: false,
              ),
            );
          }
        } else {
          updateState(
            state.copyWith(
              isLoading: false,
              loggedInSuccessfully: false,
            ),
          );
        }
      } else {
        updateState(
          state.copyWith(
            isLoading: false,
            loggedInSuccessfully: false,
          ),
        );
      }
    });
  }
}
