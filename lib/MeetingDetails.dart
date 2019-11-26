
import 'package:flutter/material.dart';
import 'package:meeting_friends/Models/Colors.dart';
import 'package:meeting_friends/Models/Meeting.dart';

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
              ListTile(
                  title: Text(_meeting.title,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                      )
                  )
              ),
              Divider(thickness: 1.0, color: Colors.grey),
              ListTile(
                  title: Text(_meeting.date,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.normal
                      )
                  )
              ),
              Divider(thickness: 1.0, color: Colors.grey),
              ListTile(
                leading: Icon(Icons.location_on, color: AppColors.mainColor),
                  title: Text(_meeting.place,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.normal
                      )
                  )
              ),
              Divider(thickness: 1.0, color: Colors.grey),
              ListTile(
                  title: Text(_meeting.price,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.normal
                      )
                  )
              ),
              Divider(thickness: 1.0, color: Colors.grey),
              ListTile(
                  title: Text(_meeting.description,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.normal
                      )
                  )
              ),
            ])
    );
  }
}