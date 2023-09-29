import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:player/src/injector.dart';
import 'package:player/src/presentation/bloc/player/player_bloc.dart';
import 'package:player/src/presentation/bloc/player_detail/player_detail_bloc.dart';
import 'package:player/src/router/app_routes.dart';

void main() {
  setup();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PlayerBloc>(
          create: (BuildContext context) => injector<PlayerBloc>(),
        ),
        BlocProvider<PlayerDetailsBloc>(
          create: (BuildContext context) => injector<PlayerDetailsBloc>(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        title: 'Player',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
