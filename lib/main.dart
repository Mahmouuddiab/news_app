import 'package:flutter/material.dart';
import 'package:news_bakry/screens/home.dart';
import 'package:news_bakry/utils/themeing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themeing.lightTheme,
      initialRoute: Home.routeName,
      routes: {
        Home.routeName:(context)=>Home(),
      },
    );
  }
}
