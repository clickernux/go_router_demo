import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_demo/app_state.dart';
import 'package:provider/provider.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({
    super.key,
    required this.label,
    required this.detailsPath,
  });
  final String label;
  final String detailsPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tab root - $label'),
        actions: [
          TextButton(
            onPressed: () {
              Provider.of<AppState>(context, listen: false).logout();
            },
            child: const Text('Logout'),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Screen $label',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            TextButton(
              onPressed: () {
                context.go(detailsPath);
              },
              child: const Text('View details'),
            ),
          ],
        ),
      ),
    );
  }
}
