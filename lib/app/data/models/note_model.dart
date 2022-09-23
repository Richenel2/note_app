class Note {
  String? title;
  String color = "#91F48F";
  String? contain;
  late DateTime date;
  String font = "Nunito";

  Note({
    this.title,
    this.color = "#91F48F",
    this.contain,
    this.font = "Nunito",
    date,
  }) : this.date = date ?? DateTime.now();

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

  bool operator ==(other) {
    if (other is! Note) {
      return false;
    }
    return title == other.title &&
        font == other.font &&
        color == other.color &&
        contain == other.contain;
  }

  Note.empty() {
    title = "";
    contain = "";
    date = DateTime.now();
  }

  Note copy() {
    return Note(
      title: title,
      contain: contain,
      color: color,
      font: font,
      date: date,
    );
  }
}
