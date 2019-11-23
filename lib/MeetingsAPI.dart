
import 'package:meeting_friends/Meeting.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class MeetingsAPI {

  Future<List<Meeting>> getMeetings() async {
    final response = await http.get(
        'http://www.mocky.io/v2/5dcf50d53000008500931e00');

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      return (json.decode(response.body) as List).map((e) =>
          Meeting.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load post');
    }
  }

}