

import 'package:flutter/material.dart';
import 'package:meeting_friends/Meeting.dart';
import 'package:meeting_friends/Router.dart';
import 'package:meeting_friends/TimeLineStates/StateContext.dart';
import 'package:meeting_friends/TimeLineStates/TimeLineState.dart';

class TimeLineLoadedState implements TimeLineState {

  final List<Meeting> meetings;
  const TimeLineLoadedState(this.meetings);

  _meetingTapped(Meeting meeting) {

    Router().navigateToMeetingDetails(meeting);

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