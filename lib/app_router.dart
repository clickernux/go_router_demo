import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_demo/about_screen.dart';
import 'package:go_router_demo/app_state.dart';
import 'package:go_router_demo/home_screen.dart';
import 'package:go_router_demo/login_screen.dart';
import 'package:go_router_demo/model/data.dart';
import 'package:go_router_demo/profile_screen.dart';

import 'details_screen.dart';
import 'root_screen.dart';
import 'scaffold_with_navbar.dart';

class AppRouter {
  final AppState appState;
  AppRouter(this.appState);
  final _rootNavigatorKey = GlobalKey<NavigatorState>();
  final _shellNavigatorKey = GlobalKey<NavigatorState>();

  late final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    initialLocation: '/a',
    refreshListenable: appState,
    routes: [
      // GoRoute(
      //     path: '/',
      //     builder: (context, state) => const HomeScreen(),
      //     routes: [
      //       GoRoute(
      //         path: 'profile',
      //         builder: (context, state) => ProfileScreen(name: state.queryParameters['name']!,),
      //       ),
      //       GoRoute(
      //         path: 'about',
      //         builder: (context, state) => AboutScreen(data: state.extra as Data,),
      //       )
      //     ]),
      GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) =>
            const LoginScreen(),
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return ScaffoldWithBottomNavBar(child: child);
        },
        routes: [
          GoRoute(
            path: '/a',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: RootScreen(label: 'A', detailsPath: '/a/details'),
            ),
            routes: [
              GoRoute(
                path: 'details',
                builder: (context, state) => const DetailsScreen(label: 'A'),
              ),
            ],
          ),
          GoRoute(
              path: '/b',
              pageBuilder: (context, state) => const NoTransitionPage(
                    child: RootScreen(label: 'B', detailsPath: '/b/details'),
                  ),
              routes: [
                GoRoute(
                  path: 'details',
                  builder: (context, state) => const DetailsScreen(label: 'B'),
                )
              ]),
        ],
      ),
    ],
    redirect: (context, state) {
      final loggedIn = appState.isLoggedIn;

      // This is important.
      // state.matchedLocation return current path
      final logginIn = state.location == '/login';
      print('Notice: ${state.location}');

      if (!loggedIn) return logginIn ? null : '/login';

      if (logginIn) return '/a';
      return null;
    },
  );
}
