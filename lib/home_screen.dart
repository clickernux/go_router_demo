import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_demo/app_state.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Go Router Demo'),
        actions: [
          TextButton(
            onPressed: () {
              Provider.of<AppState>(context, listen: false).logout();
            },
            child: const Text('Logout'),
          ),
        ],
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              context.goNamed('profile');
            },
            child: const Text('Go To Profile Screen'),
          ),
          TextButton(
            onPressed: () {
              context.goNamed('about');
            },
            child: const Text('Go To About Screen'),
          ),
        ],
      ),
    );
  }
}
