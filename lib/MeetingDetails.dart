
import 'package:flutter/material.dart';
import 'package:meeting_friends/Meeting.dart';

class MeetingDetails extends StatelessWidget {

  Meeting _meeting;

  MeetingDetails(Meeting meeting) {
    _meeting = meeting;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(_meeting.title)
      ),
      body:
          ListView(
            children: [
              Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                            _meeting.title,
                            style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold)
                        )
                      ),
                     )
                  ]),
              Row(
                  children:[
                    Expanded(
                      child:
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(_meeting.date,
                            style: TextStyle(color: Colors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.normal)
                        ),
                      )
                    )
                  ]),
              Divider(thickness: 1.0, color: Colors.grey),
              Row(
                  children: [
                    Expanded(
                        child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                            _meeting.description,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal)
                          )
                        )
                    )
                  ]),
              Divider(thickness: 1.0, color: Colors.grey),
              Row(
                  children: [
                    Padding(padding: EdgeInsets.all(10),child: Icon(Icons.location_on, color: Colors.grey)),
                    Expanded(
                      child: Text(_meeting.location.toString(),
                          style: TextStyle(color: Colors.grey, fontSize: 20)
                      ),
                    )

                  ])
            ])
    );
  }
}