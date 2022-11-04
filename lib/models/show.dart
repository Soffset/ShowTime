class Show {
  final String name;
  final String image;
  final BigInt id;
  final List<String> genres;
  final double rating;

  Show({this.name, this.image, this.id, this.genres, this.rating});

  factory Show.fromJson(dynamic json) {
    return Show(
        name: json['name'] as String,
        image: json['images']['medium'] as String,
        id: json['id'] as BigInt,
        genres: json['genres'] as List<String>,
        rating: json['rating']['average'] as double);

  }

  static List<Show> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Show.fromJson(data);
    }).toList();
  }

  @override
  String toString(){
    return 'Show {name: $name, image: $image, id: $id, genres: $genres, rating: $rating }';
  }
}