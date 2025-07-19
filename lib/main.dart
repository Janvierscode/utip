import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utip/pages/utip_page.dart';
import 'package:utip/provider/ThemeProvider.dart';
import 'package:utip/provider/UTipProvider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UTipProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'uTip',
      theme: themeProvider.isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: UTip(),
    );
  }
}
