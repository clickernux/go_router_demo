import 'package:flutter/material.dart';

class ScaffoldWithNavBarTabItem extends BottomNavigationBarItem {
  const ScaffoldWithNavBarTabItem(
      {required this.initialLocation, required Widget icon, String? label})
      : super(icon: icon, label: label);
  final String initialLocation;
}

const tabs = [
  ScaffoldWithNavBarTabItem(
      initialLocation: '/a', icon: Icon(Icons.home), label: 'Section A'),
  ScaffoldWithNavBarTabItem(
    initialLocation: '/b',
    icon: Icon(Icons.settings),
    label: 'Section B',
  ),
];
