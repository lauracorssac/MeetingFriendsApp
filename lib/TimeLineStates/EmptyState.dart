
import 'package:flutter/material.dart';
import 'package:meeting_friends/Models/Strings.dart';
import 'package:meeting_friends/TimeLineStates/StateContext.dart';
import 'package:meeting_friends/TimeLineStates/TimeLineState.dart';
import 'package:meeting_friends/TimeLineStates/TimeLineLoadingState.dart';

class TimeLineEmptyState implements TimeLineState {

  @override
  Future nextState(StateContext context) async {
    context.setState(TimeLineLoadingState());
  }

  @override
  Widget render() {

    return Flex(
      children: <Widget>[
        Text(
        Strings.noResults,
          style: TextStyle(fontSize: 24.0),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}