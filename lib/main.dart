import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utip/pages/utip_page.dart';
import 'package:utip/provider/UTipProvider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UTipProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'uTip',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: UTip(),
    );
  }
}
