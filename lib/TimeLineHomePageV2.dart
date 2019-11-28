


import 'package:flutter/material.dart';
import 'package:meeting_friends/Router.dart';
import 'package:meeting_friends/TimeLineStates/TimeLineStateContext.dart';
import 'package:meeting_friends/TimeLineStates/TimeLineLoadingState.dart';
import 'package:meeting_friends/TimeLineStates/TimeLineState.dart';

class _TimeLineV2State extends State<TimelineHomePageV2> {

  var _stateContext = TimeLineStateContext();

  _TimeLineV2State() {

    _changeState();
  }

  Future<void> _changeState() async {
    await _stateContext.nextState();
  }

  @override
  Widget build(BuildContext context) {

    Router router = Router();
    router.buildContext = context;

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.add),
            onPressed: () => _showMeetingForm(context),
          ),
        ],
      ),
      body: Center(
        child: StreamBuilder(
          initialData: TimeLineLoadingState(),
          stream: _stateContext.outState,
          builder: (_, AsyncSnapshot<TimeLineState> snapshot) =>
              snapshot.data.render(),
        )
      )
    );
  }

  @override
  void dispose() {
    _stateContext.dispose();
    super.dispose();
  }

  _showMeetingForm(BuildContext context) {

    Router().navigateToNewMeeting();
  }


}

class TimelineHomePageV2 extends StatefulWidget {


  TimelineHomePageV2({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TimeLineV2State createState() => _TimeLineV2State();

}