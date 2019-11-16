

class Meeting {

  String id;
  String title;
  String description;
  String date;

  Meeting({this.id, this.title, this.description, this.date});

  factory Meeting.fromJson(Map<String, dynamic> json) {
    return Meeting(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      date: json['date']
    );
  }

}