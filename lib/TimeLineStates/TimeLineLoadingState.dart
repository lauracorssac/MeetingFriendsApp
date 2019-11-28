


import 'package:flutter/material.dart';
import 'package:meeting_friends/Service/ServiceAdapter.dart';
import 'package:meeting_friends/Service/ServiceSingleton.dart';
import 'package:meeting_friends/TimeLineStates/TimeLineEmptyState.dart';
import 'package:meeting_friends/TimeLineStates/TimeLineErrorState.dart';
import 'package:meeting_friends/TimeLineStates/TimeLineStateContext.dart';
import 'package:meeting_friends/TimeLineStates/TimeLineLoadedState.dart';
import 'package:meeting_friends/TimeLineStates/TimeLineState.dart';

class TimeLineLoadingState implements TimeLineState {
  final ServiceAdapter _api = ServiceSingleton().service;

  @override
  Future nextState(TimeLineStateContext context) async {
    try {
      var resultList = await _api.getMeetings();

      if (resultList.isEmpty) {
        context.setState(TimeLineEmptyState());
      } else {
        context.setState(TimeLineLoadedState(resultList));
      }
    } on Exception {
      context.setState(TimeLineErrorState());
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