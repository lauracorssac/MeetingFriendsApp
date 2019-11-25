
import 'package:meeting_friends/Service/MeetingsAPI.dart';
import 'package:meeting_friends/Service/ServiceAdapter.dart';

class ServiceSingleton {

  static final ServiceSingleton _instance = ServiceSingleton._internal();

  ServiceAdapter service = MeetingsAPIMock();

  factory ServiceSingleton() {
    return _instance;
  }

  ServiceSingleton._internal();

}