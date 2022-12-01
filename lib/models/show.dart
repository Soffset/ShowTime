import 'package:progetto_esame/models/show.api.dart';

class Show {
    final String name;
    final String image;
    final int id;
    final List<String> genres;
    final String rating;
    final String duration;
    final String summary;
    final String fullImage;
    final String status;

    Show({
      required this.name,
      required this.image,
      required this.id,
      required this.genres,
      required this.rating,
      required this.duration,
      required this.summary,
      required this.fullImage,
      required this.status,});

    static String placeholderImg = 'https://cinemaone.net/images/movie_placeholder.png';

    factory Show.fromJson(dynamic showJson) {
      return Show(
        name: showJson['name'],
        image: showJson['image'] != null ? showJson['image']['medium'] : placeholderImg,
        id: showJson['id'],
        genres: (showJson["genres"] as List).map((e) => e as String).toList(),
        rating: showJson['rating']['average'].toString(),
        duration: checkString(showJson['averageRuntime']) ,
        summary: formatString( showJson['summary'] ),
        fullImage: showJson['image'] != null ? showJson['image']['original'] : placeholderImg,
        status: showJson['status'],
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
    static String checkString(str){
      if(str == null) {
        return 'none';
      } else{
        return str.toString();
      }
    }
  }