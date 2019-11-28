


import 'package:flutter/material.dart';
import 'package:meeting_friends/Models/Strings.dart';
import 'package:meeting_friends/TimeLineStates/TimeLineStateContext.dart';
import 'package:meeting_friends/TimeLineStates/TimeLineLoadingState.dart';
import 'package:meeting_friends/TimeLineStates/TimeLineState.dart';

class TimeLineErrorState implements TimeLineState {
  @override
  Future nextState(TimeLineStateContext context) async {
    context.setState(TimeLineLoadingState());
  }

  @override
  Widget render() {
    return Text(
      Strings.genericErrorMessage,
      style: TextStyle(
        color: Colors.red,
        fontSize: 24.0,
      ),
      textAlign: TextAlign.center,
    );
  }
}