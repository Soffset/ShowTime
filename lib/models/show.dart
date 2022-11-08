  class Show {
    final String name;
    final String image;
    final int id;
    final List<String> genres;
    final int rating;
    final int duration;

    Show({this.name, this.image, this.id, this.genres, this.rating, this.duration});

    factory Show.fromJson(dynamic json) {
      return Show(
          name: json['name'] as String,
          image: json['images'] as String,
          id: json['id'] as int,
          genres: json['genres'] as List<String>,
          rating: json['rating'] as int,
          duration: json['runtime']);

    }

    static List<Show> showsFromSnapshot(List snapshot) {

      return snapshot.map((data) {
        return Show.fromJson(data);
      }).toList();
    }



    @override
    String toString(){
      return 'Show {name: $name, image: $image, id: $id, genres: $genres, rating: $rating, duration: $duration }';
    }
  }