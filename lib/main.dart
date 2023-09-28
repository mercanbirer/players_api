import 'package:flutter/material.dart';
import 'package:player/src/injector.dart';
import 'package:player/src/router/app_routes.dart';

void main() {
  setup();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Player',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
