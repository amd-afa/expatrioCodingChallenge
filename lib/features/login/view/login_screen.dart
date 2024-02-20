import 'package:auto_route/auto_route.dart';
import 'package:coding_challenge/core/utilities/const/colors.dart';
import 'package:coding_challenge/core/utilities/routers/app_router.dart';
import 'package:coding_challenge/core/utilities/utils/text_style.dart';
import 'package:coding_challenge/core/utilities/widgets/custom_flush_bar_widget.dart';
import 'package:coding_challenge/core/utilities/widgets/custom_slide_up_panel_widget.dart';
import 'package:coding_challenge/core/utilities/widgets/custom_text_filed_widget.dart';
import 'package:coding_challenge/features/login/state/login_state_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<LoginScreen> {
  //   SvgPicture.asset('assets/CryingGirl.svg'),
  final emailEditTextController =
      TextEditingController(text: 'tito+bs792@expatrio.com');
  final emailFocusNode = FocusNode();
  final passwordEditTextController = TextEditingController(text: 'nemampojma');
  final passwordFocusNode = FocusNode();
  final panelController = PanelController();
  double panelHeightOpen = 300;
  double panelHeightClosed = 0;

  @override
  Widget build(BuildContext context) {
    final obscureTextActiv =
        ref.watch(loginScreenViewStateProvider).obscureTextActiv;
    final isLoading = ref.watch(loginScreenViewStateProvider).isLoading;
    return Scaffold(
      backgroundColor: cWhiteColor,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 32),
                    child: Image.asset(
                      'assets/2019_XP_logo_white.png',
                      width: 200,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 26),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.email_outlined,
                              color: cBlackColor.withOpacity(.7),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              'EMAIL ADDRESS',
                              style: tsBodyStyle.copyWith(
                                  fontSize: 12,
                                  color: cBlackColor.withOpacity(.7)),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        emailTextField(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 26),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.lock_outlined,
                              color: cBlackColor.withOpacity(.7),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              'PASSWORD',
                              style: tsBodyStyle.copyWith(
                                  fontSize: 12,
                                  color: cBlackColor.withOpacity(.7)),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        passwordTextField(obscureTextActiv),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  (!isLoading)
                      ? ZoomTapAnimation(
                          onTap: () async {
                            final email = emailEditTextController.text;
                            final password = passwordEditTextController.text;
                            if (email.isNotEmpty && password.isNotEmpty) {
                              await ref
                                  .read(loginScreenViewStateProvider.notifier)
                                  .userLogin(email, password)
                                  .then((_) {
                                final loggedInSuccessfully = ref
                                    .read(loginScreenViewStateProvider)
                                    .loggedInSuccessfully;
                                if (loggedInSuccessfully == true) {
                                  panelController.open();
                                } else if (loggedInSuccessfully == false) {
                                  FlushbarHelper.createErrorFlushbar(
                                    context: context,
                                    message:
                                        'Something went wrong while logging in. Please try again!',
                                  ).show(context);
                                }
                              });
                            } else {
                              FlushbarHelper.createInfoFlushbar(
                                context: context,
                                message: 'Please enter your email and password',
                              )!
                                  .show(context);
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 26),
                            padding: const EdgeInsets.all(14),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(32),
                              ),
                              color: cPrimeGreenColor.withOpacity(.7),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'LOGIN',
                              style:
                                  tsSubtitleStyle.copyWith(color: cWhiteColor),
                            ),
                          ),
                        )
                      : Container(
                          margin: const EdgeInsets.symmetric(horizontal: 26),
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: cPrimeGreenColor.withOpacity(.7),
                          ),
                          alignment: Alignment.center,
                          child: const CircularProgressIndicator(
                            backgroundColor: cPrimeGreenColor,
                          ),
                        ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Lottie.asset('assets/login-background.json'),
            ),
            slidingUpPanelRedirect(),
          ],
        ),
      ),
    );
  }

  CustomTextField emailTextField() {
    return CustomTextField(
      controller: emailEditTextController,
      focusNode: emailFocusNode,
      hintText: 'Email',
      contentPadding: 14,
      borderColor: cBlackColor.withOpacity(.7),
      hintTextStyle:
          tsSubtitleStyle.copyWith(color: cPrimeGreenColor.withOpacity(.4)),
      style: tsSubtitleStyle.copyWith(color: cPrimeGreenColor),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    );
  }

  CustomTextField passwordTextField(bool obscureTextActiv) {
    return CustomTextField(
      controller: passwordEditTextController,
      focusNode: passwordFocusNode,
      hintText: 'Password',
      obscureText: !obscureTextActiv,
      maxLines: 1,
      suffixWidget: ZoomTapAnimation(
        onTap: () {
          // update obscureText in state
          if (obscureTextActiv) {
            ref
                .read(loginScreenViewStateProvider.notifier)
                .updateObscureTextStatus(false);
          } else {
            ref
                .read(loginScreenViewStateProvider.notifier)
                .updateObscureTextStatus(true);
          }
        },
        child: (obscureTextActiv)
            ? const Icon(
                Icons.remove_red_eye_outlined,
                color: cPrimeGreenColor,
              )
            : const Icon(
                Icons.remove_red_eye,
                color: cPrimeGreenColor,
              ),
      ),
      contentPadding: 14,
      borderColor: cBlackColor.withOpacity(.7),
      hintTextStyle:
          tsSubtitleStyle.copyWith(color: cPrimeGreenColor.withOpacity(.4)),
      style: tsSubtitleStyle.copyWith(color: cPrimeGreenColor),
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
    );
  }

  Widget slidingUpPanelRedirect() {
    return SlidingUpPanel(
        controller: panelController,
        maxHeight: panelHeightOpen,
        minHeight: panelHeightClosed,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: cWhiteColor,
        parallaxEnabled: false,
        panelSnapping: false,
        backdropEnabled: true,
        isDraggable: false,
        panelBuilder: (
          controller,
        ) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Icon(
                  Icons.check_circle,
                  color: cPrimeGreenColor,
                  size: 82,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Successfull Login',
                  style: tsTitleStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'You will be redirected to your dashboard',
                  style: tsSubtitleStyle,
                ),
                const SizedBox(
                  height: 24,
                ),
                ZoomTapAnimation(
                  onTap: () {
                    AutoRouter.of(context).replace(
                      const DashboardRoute(),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    width: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(32),
                      ),
                      color: cPrimeGreenColor.withOpacity(.7),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'GOT IT',
                      style: tsSubtitleStyle.copyWith(
                        color: cWhiteColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
