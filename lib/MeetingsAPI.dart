
import 'package:meeting_friends/Models/Meeting.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class MeetingsAPI {

  Future<List<Meeting>> getMeetings() async {
    final response = await http.get(
        'http://www.mocky.io/v2/5ddaf2153100005300605f03');

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      return (json.decode(response.body) as List).map((e) =>
          Meeting.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<bool> saveMeeting(Meeting meeting) async {


    String json = jsonEncode(meeting);

    final response = await http.post("http://www.mocky.io/v2/5ddae8193100003803605efc", body: json);

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      return true;
    } else {
      return false;
    }
  }

}