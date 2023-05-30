import 'package:flutter/material.dart';
import 'package:go_router_demo/app_router.dart';
import 'package:go_router_demo/app_state.dart';
import 'package:provider/provider.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  final appState = AppState();
  await appState.initializeApp();
  runApp(
    ChangeNotifierProvider(
      create: (context) => appState,
      child: MyApp(
        appState: appState,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appState});
  final AppState appState;

  @override
  Widget build(BuildContext context) {
    late final appRouter = AppRouter(appState);

    return Consumer(
      builder: (context, value, child) {
        final router = appRouter.router;
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
          ),
          routerDelegate: router.routerDelegate,
          routeInformationParser: router.routeInformationParser,
          routeInformationProvider: router.routeInformationProvider,
        );
      },
    );
  }
}
