import 'package:another_flushbar/flushbar.dart';
import 'package:coding_challenge/core/utilities/const/colors.dart';
import 'package:coding_challenge/core/utilities/utils/text_style.dart';
import 'package:flutter/material.dart';

class FlushbarWrapper {
  Flushbar<dynamic>? flushbar;
}

class ParentFlushbar extends InheritedWidget {
  final FlushbarWrapper? flushbarWrapper;

  const ParentFlushbar({
    required Widget child,
    this.flushbarWrapper,
    Key? key,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  static ParentFlushbar? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ParentFlushbar>();
  }

  void dismiss(dynamic result) {
    flushbarWrapper!.flushbar!.dismiss(result);
  }
}

class FlushbarHelper {
  static late BuildContext flushbarGlobalContext;
  static Flushbar<dynamic>? currentUserInformationFlushbar;
  static Flushbar<dynamic>? currentContentFlushbar;

  static void dismissCurrentUserInformationFlushbar() {
    if (currentUserInformationFlushbar != null) {
      currentUserInformationFlushbar!.dismiss();
    }
  }

  /// Get a info notification flushbar.
  static Flushbar<dynamic>? createInfoFlushbar({
    required BuildContext context,
    required String message,
    Icon infoIcon = const Icon(
      Icons.info_outline,
      color: cGrayColor,
    ),
    Duration duration = const Duration(seconds: 4),
    Function(Flushbar<dynamic>?)? onTap,
  }) {
    dismissCurrentUserInformationFlushbar();
    late Flushbar<dynamic> successFlushbar;
    successFlushbar = Flushbar<dynamic>(
      messageText: Text(
        message,
        style: tsSubtitleStyle.copyWith(
          color: cLightWhiteColor,
        ),
      ),
      flushbarPosition: FlushbarPosition.TOP,
      shouldIconPulse: false,
      backgroundColor: cPrimeGreenColor,
      borderRadius: BorderRadius.circular(16),
      duration: duration,
      animationDuration: const Duration(milliseconds: 500),
      borderWidth: 0,
      routeBlur: 30,
      maxWidth: double.infinity - 30,
      margin: const EdgeInsets.symmetric(vertical: 100),
      onTap: onTap,
      icon: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(2),
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: cGrayColor.withOpacity(.4),
        ),
        child: infoIcon,
      ),
      mainButton: TextButton(
        onPressed: () {
          successFlushbar.dismiss(true);
        },
        child: const Icon(Icons.close, size: 22, color: cGrayColor),
      ),
    );
    currentUserInformationFlushbar = successFlushbar;
    return successFlushbar;
  }

  /// Get a success notification flushbar.
  static Flushbar<dynamic>? createSuccessFlushbar({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 3),
    Function(Flushbar<dynamic>?)? onTap,
    void Function()? undoOnTap,
    bool withUndoButton = false,
  }) {
    dismissCurrentUserInformationFlushbar();
    late Flushbar<dynamic> successFlushbar;
    successFlushbar = Flushbar<dynamic>(
      messageText: Text(
        message,
        style: tsSubtitleStyle.copyWith(
          color: cLightWhiteColor,
        ),
      ),
      flushbarPosition: FlushbarPosition.TOP,
      shouldIconPulse: false,
      backgroundColor: cPrimeGreenColor,
      borderRadius: BorderRadius.circular(16),
      duration: duration,
      animationDuration: const Duration(milliseconds: 500),
      borderWidth: 0,
      routeBlur: 30,
      maxWidth: double.infinity - 30,
      margin: const EdgeInsets.symmetric(vertical: 100),
      onTap: onTap,
      icon: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(2),
        width: 30,
        height: 30,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              cOrangeColor,
              cPrimeGreenColor,
            ],
          ),
        ),
        child: const Icon(
          Icons.check,
          color: cWhiteColor,
        ),
      ),
      mainButton: (withUndoButton)
          ? TextButton(
              onPressed: undoOnTap,
              child: const Icon(Icons.undo, size: 24, color: cOrangeColor),
            )
          : TextButton(
              onPressed: () {
                successFlushbar.dismiss(true);
              },
              child:
                  const Icon(Icons.arrow_drop_up, size: 24, color: cGrayColor),
            ),
    );
    currentUserInformationFlushbar = successFlushbar;
    return successFlushbar;
  }

  /// Get a error notification flushbar
  static Flushbar<dynamic> createErrorFlushbar({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 4),
    FlushbarPosition position = FlushbarPosition.TOP,
    Function(Flushbar<dynamic>)? onTap,
  }) {
    dismissCurrentUserInformationFlushbar();
    late Flushbar<dynamic> errorFlushbar;
    errorFlushbar = Flushbar<dynamic>(
      messageText: Text(
        message,
        style: tsSubtitleStyle.copyWith(
          color: cLightWhiteColor,
        ),
      ),
      flushbarPosition: position,
      backgroundColor: cPrimeGreenColor,
      borderRadius: BorderRadius.circular(16),
      duration: duration,
      shouldIconPulse: false,
      animationDuration: const Duration(milliseconds: 500),
      routeBlur: 30,
      margin: const EdgeInsets.symmetric(vertical: 100),
      maxWidth: double.infinity - 30,
      onTap: onTap,
      icon: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(2),
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: cRedColor.withOpacity(.2),
        ),
        child: const Icon(
          Icons.close,
          color: cRedColor,
          size: 22,
        ),
      ),
      mainButton: TextButton(
        onPressed: () {
          errorFlushbar.dismiss(true);
        },
        child: const Icon(Icons.arrow_drop_up, size: 24, color: cGrayColor),
      ),
    );
    currentUserInformationFlushbar = errorFlushbar;
    return errorFlushbar;
  }
}
