import 'package:go_router/go_router.dart';
import 'package:go_router_demo/about_screen.dart';
import 'package:go_router_demo/app_state.dart';
import 'package:go_router_demo/home_screen.dart';
import 'package:go_router_demo/login_screen.dart';
import 'package:go_router_demo/profile_screen.dart';

class AppRouter {
  final AppState appState;
  AppRouter(this.appState);

  late final router = GoRouter(
    debugLogDiagnostics: true,
    // initialLocation: appState.isLoggedIn ? '/' : '/login',
    refreshListenable: appState,
    routes: [
      GoRoute(
          path: '/',
          name: 'home',
          builder: (context, state) => const HomeScreen(),
          routes: [
            GoRoute(
              path: 'profile',
              name: 'profile',
              builder: (context, state) => const ProfileScreen(),
            ),
            GoRoute(
              path: 'about',
              name: 'about',
              builder: (context, state) => const AboutScreen(),
            )
          ]),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
    ],
    redirect: (context, state) {
      // final loggedIn = Provider.of<AppState>(context).isLoggedIn;
      final loggedIn = appState.isLoggedIn;
      // final loggedIn = context.watch<AppState>().isLoggedIn;
      final logginIn = state.location == '/login';

      if (!loggedIn) return logginIn ? null : '/login';
      if (loggedIn) return '/';
      return null;
    },
  );
}
