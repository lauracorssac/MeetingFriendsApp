

class Meeting {

  String title;
  String description;
  String date;
  String place;
  String price;
  String creator;

  Meeting({this.title, this.description, this.date, this.place, this.price, this.creator});

  factory Meeting.fromJson(Map<String, dynamic> json) {

    return Meeting(
      title: json['eventName'],
      description: json['description'],
      date: json['date'],
      price: json['cost'],
      place: json['place'],
      creator: json['creator']
    );
  }

}