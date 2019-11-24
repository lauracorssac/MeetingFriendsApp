

import 'package:meeting_friends/Models/Location.dart';

class Meeting {

  String id;
  String title;
  String description;
  String date;
  Location location;

  Meeting({this.id, this.title, this.description, this.date, this.location});

  factory Meeting.fromJson(Map<String, dynamic> json) {

    Map<String, dynamic> locationJson = json['location'];

    return Meeting(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      date: json['date'],
      location: Location.fromJson(locationJson)

    );
  }

}