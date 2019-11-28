
import 'package:flutter/material.dart';
import 'package:meeting_friends/TimeLineStates/TimeLineStateContext.dart';

abstract class TimeLineState {
  Future nextState(TimeLineStateContext context);
  Widget render();
}