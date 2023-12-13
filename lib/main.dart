import 'package:fl_clean_arch_hexagonal/core/presentation/home.dart';
import 'package:fl_clean_arch_hexagonal/core/services/api_services.dart';
import 'package:fl_clean_arch_hexagonal/dependency_injector.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  ApiServices.init();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}
