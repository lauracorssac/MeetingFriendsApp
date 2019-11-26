
import 'package:meeting_friends/Models/Meeting.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:meeting_friends/Service/ServiceAdapter.dart';

class MeetingsAPIMock implements ServiceAdapter {

  Future<List<Meeting>> getMeetings() async {

    final response = await http.get('http://www.mocky.io/v2/5ddb2a123100007a00605f57');

    if (response.statusCode == 200) {

        print("heeeeyyyyyy");
        List<Meeting> meetings =  (json.decode(response.body) as List).map((e) =>
            Meeting.fromJson(e)).toList();
        return meetings;

    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<bool> saveMeeting(Meeting meeting) async {

    String json = jsonEncode(meeting);

    final response = await http.post("http://www.mocky.io/v2/5ddae8193100003803605efc", body: json);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

}