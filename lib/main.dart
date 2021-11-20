import 'package:flutter/material.dart';
import 'package:provider_with_select/example_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ExampleApp();
  }
}

