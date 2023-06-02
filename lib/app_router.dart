import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_demo/about_screen.dart';
import 'package:go_router_demo/app_state.dart';
import 'package:go_router_demo/home_screen.dart';
import 'package:go_router_demo/login_screen.dart';
import 'package:go_router_demo/model/data.dart';
import 'package:go_router_demo/profile_screen.dart';

class AppRouter {
  final AppState appState;
  AppRouter(this.appState);

  late final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/login',
    refreshListenable: appState,
    routes: [
      GoRoute(
          path: '/',
          
          builder: (context, state) => const HomeScreen(),
          routes: [
            GoRoute(
              path: 'profile',
              
              builder: (context, state) => ProfileScreen(name: state.queryParameters['name']!,),
            ),
            GoRoute(
              path: 'about',
              builder: (context, state) => AboutScreen(data: state.extra as Data,),
            )
          ]),
      GoRoute(
        path: '/login',
      
        builder: (BuildContext context, GoRouterState state) => const LoginScreen(),
      ),
    ],
    redirect: (context, state) {
      
      final loggedIn = appState.isLoggedIn;
      
      // This is important.
      // state.matchedLocation return current path
      final logginIn = state.location == '/login';
      print('Notice: ${state.location}');

      if (!loggedIn) return logginIn ? null : '/login';
      
      if (logginIn) return '/';
      return null;
    },
  );
}
