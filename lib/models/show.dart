import 'package:progetto_esame/models/show.api.dart';

class Show {
    final String name;
    final String image;
    final int id;
    final List<String> genres;
    final String rating;
    final int duration;
    final String summary;
    final String fullImage;

    Show({
      required this.name,
      required this.image,
      required this.id,
      required this.genres,
      required this.rating,
      required this.duration,
      required this.summary,
      required this.fullImage});

    factory Show.fromJson(TmpShow a) {
      return Show(
        name: a.name,
        image: a.image,
        id: a.id,
        genres: a.genres,
        rating: a.rating,
        duration: a.duration,
        summary: a.summary,
        fullImage: a.fullImage);

    }

    static List<Show> showsFromSnapshot(List snapshot) {
      return snapshot.map((data) {
        return Show.fromJson(data);
      }).toList();
    }



    @override
    String toString(){
      return 'Show {name: $name, image: $image, id: $id, genres: $genres, rating: $rating, duration: $duration, summary: $summary, fullImage: $fullImage }';
    }
  }