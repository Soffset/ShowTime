import 'package:progetto_esame/models/show.api.dart';

class Show {
    final String name;
    final String image;
    final int id;
    //final List<String> genres;
    final String rating;
    final int duration;
    final String summary;
    final String fullImage;

    Show({
      required this.name,
      required this.image,
      required this.id,
      //required this.genres,
      required this.rating,
      required this.duration,
      required this.summary,
      required this.fullImage});

    factory Show.fromJson(dynamic showJson) {
      return Show(
        name: showJson['name'],
        image: showJson['image']['medium'],
        id: showJson['id'],
        //genres: showJson['genres'],
        rating: showJson['rating']['average'].toString(),
        duration: showJson['averageRuntime'],
        summary: formatString( showJson['summary'] ),
        fullImage: showJson['image']['original'],
      );
    }

    static List<Show> showsFromSnapshot(List snapshot) {
      return snapshot.map((data) {
        return Show.fromJson(data);
      }).toList();
    }

    static String formatString(String str){
      String formatted = str;
      formatted = formatted.replaceAll ("<p>", "").replaceAll ("</p>", "");
      formatted = formatted.replaceAll ("<b>", "").replaceAll ("</b>", "");
      formatted = formatted.replaceAll ("<i>", "").replaceAll ("</i>", "");
      return formatted;
    }
  }