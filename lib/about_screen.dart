import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_demo/model/data.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key, required this.data});
  final Data data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About: ${data.name}'),
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
