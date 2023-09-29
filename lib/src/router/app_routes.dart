import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:player/src/data/models/player.dart';
import 'package:player/src/presentation/view/player/player_screen.dart';
import 'package:player/src/presentation/view/player_detail/player_details_screen.dart';
import '../presentation/view/not_found_page.dart';

final router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
        name: 'playerScreen',
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const PlayerScreen(),
        routes: <GoRoute>[
          GoRoute(
            name: 'playerDetailScreen',
            path: 'playerDetailScreen',
            builder: (BuildContext context, GoRouterState state) {
              final params = state.extra as Map<Player, Object>?;
              if (params != null) {
                final player = params['player'] as Player?;
                if (player != null) {
                  return PlayerDetailsScreen(player: player);
                }
              }
              return const Scaffold(
                body: Center(
                  child: Text('Error'),
                ),
              );
            },
          ),
        ]),
  ],
  errorBuilder: (context, state) => const NotFoundScreen(),
);
