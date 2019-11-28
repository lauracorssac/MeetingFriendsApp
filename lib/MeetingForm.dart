
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:meeting_friends/Models/Meeting.dart';
import 'package:meeting_friends/Models/Strings.dart';
import 'package:meeting_friends/Router.dart';
import 'package:meeting_friends/Service/ServiceAdapter.dart';
import 'package:meeting_friends/Service/ServiceSingleton.dart';

class MeetingForm extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  final ServiceAdapter _api = ServiceSingleton().service;
  Meeting _meeting = new Meeting();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.newMeetingNavTitle)
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Título:"),
              subtitle: TextFormField(
                validator: (text) {
                  if (text.isEmpty) {
                    return "Título da reunião não pode ser vazio!";
                  } else {
                    return null;
                  }
                },
                onSaved: (text) => _meeting.title = text,
              ),
            ),
            ListTile(
              title: Text("Data:"),
              subtitle: TextFormField(
                validator: (text) {

                  if (text.isEmpty) {
                    return "Data da reunião não pode ser vazia!";
                  } else {

                    return null;
                  }
                },
                onSaved: (text) => _meeting.date = text,
              ),
            ),
            ListTile(
              title: Text("Local:"),
              subtitle: TextFormField(
                validator: (text) {
                  if (text.isEmpty) {
                    return "Local da reunião não pode ser vazio!";
                  } else {
                    return null;
                  }},
                onSaved: (text) => _meeting.place = text,
              ),
            ),
            ListTile(
              title: Text("Descrição:"),
              subtitle: TextFormField(
                onSaved: (text) => _meeting.description = text,
              ),
            ),
            ListTile(
              title: Text("Estimativa de valor a ser gasto:"),
              subtitle: TextFormField(
                onSaved: (text) => _meeting.price = text,
              ),
            ),
            SnackBarBody(_formKey, _meeting)

          ],
        ),
      ),
    );
  }
}

class SnackBarBody extends StatelessWidget {

  GlobalKey<FormState> _formKey;
  Meeting _meeting;
  final ServiceAdapter _api = ServiceSingleton().service;

  SnackBarBody( GlobalKey<FormState> formKey, Meeting meeting) {
    _meeting = meeting;
    _formKey = formKey;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text(Strings.newMeetingDoneButtonTitle),
        onPressed: () async {

          if (_formKey.currentState.validate() ) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(Strings.loadingMessage),
              ),
            );

            var result = await _api.saveMeeting(_meeting);
            if (result) {
              Navigator.pop(context);
            } else {
              _ratingErrorDialog(context);
            }

          }

        },
      ),
    );
  }

  Future<Null> _ratingErrorDialog(BuildContext context) async {
    // showDialog is a built-in Flutter method.
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(Strings.genericErrorMessage),
          content: Text(Strings.genericErrorDescription),
          actions: [
            FlatButton(
              child: Text(Strings.close),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      },
    );
  }
}
