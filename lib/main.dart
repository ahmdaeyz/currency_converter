import 'package:currency_converter/app.dart';
import 'package:currency_converter/core/application/di/injection_container.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDI();
  runApp(const App());
}
