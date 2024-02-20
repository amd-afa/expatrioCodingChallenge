import 'package:auto_route/auto_route.dart';
import 'package:coding_challenge/core/utilities/const/colors.dart';
import 'package:coding_challenge/core/utilities/routers/app_router.dart';
import 'package:coding_challenge/core/utilities/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            InkWell(
              onTap: () {
                AutoRouter.of(context).push(const DashboardRoute());
              },
              child: Text(
                'Hi this is test screen',
                style: tsHeadLine.copyWith(color: cRedColor),
              ),
            )
          ],
        )),
      ),
    );
  }
}
