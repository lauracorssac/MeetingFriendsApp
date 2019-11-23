

import 'package:flutter/material.dart';
import 'package:meeting_friends/Meeting.dart';
import 'package:meeting_friends/MeetingDetails.dart';
import 'package:meeting_friends/StateContext.dart';
import 'package:meeting_friends/TimeLineState.dart';

class TimeLineLoadedState implements TimeLineState {

  final List<Meeting> meetings;
  const TimeLineLoadedState(this.meetings);

  _meetingTapped(Meeting meeting) {

//    Navigator.push(
//      context,
//      MaterialPageRoute(builder: (context) => MeetingDetails()),
//    );

  }

  Widget _buildRow(Meeting meeting) {
    return ListTile(
      title: Text(
        meeting.title,
      ),
      subtitle: Text(
          meeting.description
      ),
      onTap: () => _meetingTapped(meeting),
    );
  }

  @override
  Future nextState(StateContext context) {

    return null;

  }

  @override
  Widget render() {

    return ListView.builder(
        itemCount: meetings.length,
        itemBuilder: (context, int) {
          return _buildRow(meetings[int]);
    });
  }

}