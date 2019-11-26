import 'package:flutter/material.dart';
import 'package:meeting_friends/Models/Colors.dart';
import 'package:meeting_friends/Models/Strings.dart';
import 'package:meeting_friends/TimeLineHomePageV2.dart';
import 'package:meeting_friends/TimelineHomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: AppColors.mainColor),
      home: TimelineHomePageV2(title: Strings.mainNavTitle),
    );
  }
}
