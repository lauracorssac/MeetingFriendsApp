import 'package:flutter/material.dart';
import 'package:meeting_friends/TimelineHomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: TimelineHomePage(title: 'Your Meetings'),
    );
  }
}
