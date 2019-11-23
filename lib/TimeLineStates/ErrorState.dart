


import 'package:flutter/material.dart';
import 'package:meeting_friends/TimeLineStates/StateContext.dart';
import 'package:meeting_friends/TimeLineStates/TimeLineLoadingState.dart';
import 'package:meeting_friends/TimeLineStates/TimeLineState.dart';

class ErrorState implements TimeLineState {
  @override
  Future nextState(StateContext context) async {
    context.setState(TimeLineLoadingState());
  }

  @override
  Widget render() {
    return Text(
      'Oops! Something went wrong...',
      style: TextStyle(
        color: Colors.red,
        fontSize: 24.0,
      ),
      textAlign: TextAlign.center,
    );
  }
}