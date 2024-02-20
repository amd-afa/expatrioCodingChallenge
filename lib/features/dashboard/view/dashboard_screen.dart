import 'package:coding_challenge/core/utilities/const/colors.dart';
import 'package:coding_challenge/core/utilities/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhiteColor,
      body: SafeArea(
          child: Column(
        children: [
          Text(
            'This is Dashboard test text',
            style: tsHeadLine.copyWith(
              color: cOrangeColor,
            ),
          )
        ],
      )),
    );
  }
}
