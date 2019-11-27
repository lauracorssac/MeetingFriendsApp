
import 'package:meeting_friends/Service/MeetingsAPI.dart';
import 'package:meeting_friends/Service/MeetingsAPIHardCoded.dart';
import 'package:meeting_friends/Service/ServiceAdapter.dart';

class ServiceSingleton {

  static final ServiceSingleton _instance = ServiceSingleton._internal();

  ServiceAdapter service = MeetingsAPIHardCoded();

  factory ServiceSingleton() {
    return _instance;
  }

  ServiceSingleton._internal();

}