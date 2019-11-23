


import 'package:flutter/material.dart';
import 'package:meeting_friends/TimeLineStates/EmptyState.dart';
import 'package:meeting_friends/TimeLineStates/ErrorState.dart';
import 'package:meeting_friends/MeetingsAPI.dart';
import 'package:meeting_friends/TimeLineStates/StateContext.dart';
import 'package:meeting_friends/TimeLineStates/TimeLineLoadedState.dart';
import 'package:meeting_friends/TimeLineStates/TimeLineState.dart';

class TimeLineLoadingState implements TimeLineState {
  final MeetingsAPI _api = MeetingsAPI();

  @override
  Future nextState(StateContext context) async {
    try {
      var resultList = await _api.getMeetings();

      if (resultList.isEmpty) {
        context.setState(TimeLineEmptyState());
      } else {
        context.setState(TimeLineLoadedState(resultList));
      }
    } on Exception {
      context.setState(ErrorState());
    }
  }

  @override
  Widget render() {
    return CircularProgressIndicator(
      backgroundColor: Colors.transparent,
      valueColor: AlwaysStoppedAnimation<Color>(
        Colors.black,
      ),
    );
  }
}