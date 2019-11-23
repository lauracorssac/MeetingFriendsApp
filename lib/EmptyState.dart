
import 'package:flutter/material.dart';
import 'package:meeting_friends/StateContext.dart';
import 'package:meeting_friends/TimeLineState.dart';
import 'package:meeting_friends/TimeLineLoadingState.dart';

class TimeLineEmptyState implements TimeLineState {

  @override
  Future nextState(StateContext context) async {
    context.setState(TimeLineLoadingState());
  }

  @override
  Widget render() {
    return Text(
      'No Results',
      style: TextStyle(fontSize: 24.0),
      textAlign: TextAlign.center,
    );
  }
}