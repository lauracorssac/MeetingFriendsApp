
import 'package:flutter/material.dart';
import 'package:meeting_friends/Meeting.dart';
import 'package:http/http.dart' as http;
import 'package:meeting_friends/MeetingDetails.dart';
import 'dart:async';
import 'dart:convert';

import 'package:meeting_friends/MeetingForm.dart';

class _TimelineHomePageState extends State<TimelineHomePage> {


  Future<List<Meeting>> meetings;

  @override
  void initState() {
    super.initState();
    meetings = getMeetings();
  }

  Future<List<Meeting>> getMeetings() async {
    final response =  await http.get('http://www.mocky.io/v2/5dcf50d53000008500931e00');

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      return (json.decode(response.body) as List).map( (e) => Meeting.fromJson(e) ).toList();

    } else {

      throw Exception('Failed to load post');
    }
  }

  Widget _buildRow(Meeting meeting) {
    return ListTile(
      title: Text(
        meeting.title,
      ),
      subtitle: Text(
        meeting.description
      ),
      onTap: () => _meetingTapped(meeting),
    );
  }

  _showMeetingForm() {

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MeetingForm()),
    );

  }

  _meetingTapped(Meeting meeting) {

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MeetingDetails()),
    );

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
        child: FutureBuilder(
          future: meetings,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, int) {
                  return _buildRow(snapshot.data[int]);
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }

}

class TimelineHomePage extends StatefulWidget {

  TimelineHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TimelineHomePageState createState() => _TimelineHomePageState();

}
