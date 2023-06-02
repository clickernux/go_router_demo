import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          context.pop();
        },
        child: const Text('Go Back'),
      ),
    );
  }
}
