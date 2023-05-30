import 'package:flutter/material.dart';
import 'package:go_router_demo/app_state.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          Provider.of<AppState>(context, listen: false).login();
          print('Pressed Login');
        },
        child: const Text('Login'),
      ),
    );
  }
}
