
import 'package:flutter/material.dart';
import 'package:meeting_friends/TimeLineStates/StateContext.dart';

abstract class TimeLineState {
  Future nextState(StateContext context);
  Widget render();
}