
import 'package:flutter/material.dart';
import 'package:meeting_friends/Models/Meeting.dart';
import 'package:meeting_friends/MeetingDetails.dart';
import 'package:meeting_friends/MeetingForm.dart';

class Router {

  static final Router _instance = Router._internal();

  BuildContext buildContext;

  factory Router() {
    return _instance;
  }

  Router._internal();

  navigateToNewMeeting() {
        Navigator.push(
          this.buildContext,
          MaterialPageRoute(builder: (context) => MeetingForm()),
        );
  }

  navigateToMeetingDetails(Meeting meeting) {

    Navigator.push(
      buildContext,
      MaterialPageRoute(builder: (context) => MeetingDetails(meeting)),
    );
  }

  navigateBackToHome() {
    Navigator.pop(this.buildContext);
  }

}