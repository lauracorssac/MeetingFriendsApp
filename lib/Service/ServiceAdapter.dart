
import 'package:meeting_friends/Models/Meeting.dart';
import 'dart:async';

abstract class ServiceAdapter {
  Future<List<Meeting>> getMeetings();
  Future<bool> saveMeeting(Meeting meeting);
}