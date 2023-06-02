import 'package:flutter/material.dart';
import 'package:go_router_demo/app_router.dart';
import 'package:go_router_demo/app_state.dart';
import 'package:provider/provider.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  final appState = AppState();
  await appState.initializeApp();
  runApp(
    MyApp(
      appState: appState,
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.appState});
  final AppState appState;
  late final appRouter = AppRouter(appState);
  @override
  Widget build(BuildContext context) {
    final router = appRouter.router;

    return ChangeNotifierProvider<AppState>(
      create: (context) => appState,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        routerConfig: router,
      ),
    );
  }
}
