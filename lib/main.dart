import 'package:flutter/material.dart';
import 'package:paseeta/core/services/services.dart';
import 'package:paseeta/paseeta_app.dart';
import 'package:paseeta/presentation/view/screen/error/error_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return const ErrorView();
  };
  await setup();
  runApp(const PaseetaApp());
}
