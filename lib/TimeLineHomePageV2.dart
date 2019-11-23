


import 'package:flutter/material.dart';
import 'package:meeting_friends/MeetingForm.dart';
import 'package:meeting_friends/StateContext.dart';
import 'package:meeting_friends/TimeLineLoadingState.dart';
import 'package:meeting_friends/TimeLineState.dart';

class _TimeLineV2State extends State<TimelineHomePageV2> {

  var _stateContext = StateContext();

  _TimeLineV2State() {
    _changeState();
  }

  Future<void> _changeState() async {
    await _stateContext.nextState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.add),
            onPressed: () => _showMeetingForm(),
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

  _showMeetingForm() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MeetingForm()),
    );
  }


}

class TimelineHomePageV2 extends StatefulWidget {


  TimelineHomePageV2({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TimeLineV2State createState() => _TimeLineV2State();

}