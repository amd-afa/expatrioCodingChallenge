import 'package:coding_challenge/core/utilities/dependency_injection/get_it_config.dart';
import 'package:coding_challenge/core/utilities/expatrio_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(
    const ProviderScope(child: ExpatrioApp()),
  );
}
