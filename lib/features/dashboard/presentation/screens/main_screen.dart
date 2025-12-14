import 'package:flutter/material.dart';
import 'package:go_router/src/route.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required StatefulNavigationShell shell});

  static const String path = '/main';
  static const String name = 'MainScreen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Main Screen',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
