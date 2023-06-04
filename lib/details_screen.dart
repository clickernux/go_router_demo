import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.label});
  final String label;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Screen - ${widget.label}'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Clicked Count: $_count'),
            TextButton.icon(
              onPressed: () {
                setState(() {
                  _count++;
                });
              },
              icon: const Icon(Icons.add),
              label: const Text('Click Me'),
            ),
          ],
        ),
      ),
    );
  }
}
