import 'package:flutter/material.dart';
import 'package:move_delivery/screens/home_screen.dart';
import 'package:move_delivery/theme/app_theme.dart';

void main() {
  runApp(const MoveApp());
}

class MoveApp extends StatelessWidget {
  const MoveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      home: const HomeScreen(),
    );
  }
}
