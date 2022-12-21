import 'package:arabee_voice_recorder/app.dart';
import 'package:arabee_voice_recorder/core/dependency_injection/injection_container.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDi();
  runApp(App());
}
