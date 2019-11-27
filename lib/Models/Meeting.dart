import 'package:meeting_friends/Models/Strings.dart';

class Meeting {

  String title;
  String description;
  String date;
  String place;
  String price;
  String creator;

  Meeting({this.title, this.description, this.date, this.place, this.price, this.creator});
  //Meeting(String title, String description, String date, String place, String price, String creator);

  factory Meeting.fromJson(Map<String, dynamic> json) {

    String title = json['eventName'] as String;
    String description = json['description'] as String;
    String date = json['date'] as String;
    String price = json['cost'] as String;
    String place = json['place'] as String;
    String creator = json['creator'] as String;

    if ([title, date, place].map( (e) => e == null).contains(true)) {
      throw Exception('Failed to get meeting');
    }

    return Meeting(
      title: title,
      description: description != null ? description :  "",
      date: date,
      price: price != null ? price : "",
      place: place,
      creator: creator != null ? creator : ""
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'eventName': title,
        'description': description,
        'date': date,
        'cost': price,
        'place': place,
        'creator': creator,
      };

}