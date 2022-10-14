class Genre {
  final int id;
  final String name;

  String error;

  Genre({this.id = 0, this.name = "", this.error =""});

  factory Genre.fromJson(dynamic json) {
    if (json == null) {
      return Genre();
    }
    return Genre(id: json['id'], name: json['name']);
  }
}