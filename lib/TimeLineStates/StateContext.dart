
import 'dart:async';

import 'package:meeting_friends/TimeLineStates/EmptyState.dart';
import 'package:meeting_friends/TimeLineStates/TimeLineLoadingState.dart';
import 'package:meeting_friends/TimeLineStates/TimeLineState.dart';


class StateContext {
  StreamController<TimeLineState> _stateStream = StreamController<TimeLineState>();
  Sink<TimeLineState> get _inState => _stateStream.sink;
  Stream<TimeLineState> get outState => _stateStream.stream;

  TimeLineState _currentState;

  StateContext() {
    _currentState = TimeLineLoadingState();
    _addCurrentStateToStream();
  }

  void dispose() {
    _stateStream.close();
  }

  void setState(TimeLineState state) {
    _currentState = state;
    _addCurrentStateToStream();
  }

  void _addCurrentStateToStream() {
    _inState.add(_currentState);
  }

  Future<void> nextState() async {
    await _currentState.nextState(this);

    if (_currentState is TimeLineEmptyState) {
      await _currentState.nextState(this);
    }
  }
}