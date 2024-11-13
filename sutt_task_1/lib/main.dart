import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sutt_task_1/pages/login_screen.dart';
import 'package:sutt_task_1/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      theme: themeProvider.isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: const LoginScreen(),
    );
  }
}
