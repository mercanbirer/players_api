import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:player/src/presentation/view/player/player_screen.dart';
import 'package:player/src/presentation/view/player_detail/player_details_screen.dart';
import '../data/models/player.dart';
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
              Player player = state.extra as Player;
              return PlayerDetailsScreen(player: player);

            },
          ),
        ]),
  ],
  errorBuilder: (context, state) => const NotFoundScreen(),
);
