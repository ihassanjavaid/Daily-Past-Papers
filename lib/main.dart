import 'package:dailypastpapers/screens/mainScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(DailyPastPapers());

class DailyPastPapers extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daily Past Papers',
      theme: ThemeData.dark(),
      home: MainScreen(),
    );
  }
}