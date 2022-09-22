class Note {
  String? title;
  String? color;
  String? contain;
  late DateTime date;
  String? font;

  Note({this.title, this.color, this.contain, this.font, date})
      : this.date = date ?? DateTime.now();

  Note.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    font = json['font'];
    color = json['color'];
    contain = json['contain'];
    date = DateTime.parse(json["date"]);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['font'] = font;
    data['color'] = color;
    data['contain'] = contain;
    data["date"] = date.toString();
    return data;
  }
}
