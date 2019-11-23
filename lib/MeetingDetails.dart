
import 'package:flutter/material.dart';
import 'package:meeting_friends/Meeting.dart';

class MeetingDetails extends StatelessWidget {

  Meeting _meeting;

  MeetingDetails(Meeting meeting) {
    _meeting = meeting;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(_meeting.title)
      ),
    );
  }
}