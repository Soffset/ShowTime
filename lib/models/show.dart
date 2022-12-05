import 'dart:convert';

import 'package:progetto_esame/models/show.api.dart';

class Show {
    final String name;
    final String image;
    final int id;
    final List<String>? genres;
    final String? rating;
    final String? year;
    final String? summary;
    final String fullImage;
    final String status;

    Show({
      required this.name,
      required this.image,
      required this.id,
      required this.genres,
      required this.rating,
      required this.year,
      required this.summary,
      required this.fullImage,
      required this.status,});

    static String placeholderImg = 'https://cinemaone.net/images/movie_placeholder.png';

    factory Show.fromJson(Map<String, dynamic> showJson) {
      return Show(
        name: showJson['name'],
        image: showJson['image'] != null ? showJson['image']['medium'] : placeholderImg,
        id: showJson['id'],
        genres: (showJson["genres"] as List).map((e) => e as String).toList(),
        rating: showJson['rating']['average'].toString(),
        year: getYear(showJson['premiered']),
        summary: formatString( checkString(showJson['summary']) ),
        fullImage: showJson['image'] != null ? showJson['image']['original'] : placeholderImg,
        status: showJson['status'],
      );
    }

    factory Show.fromPreferences(Map<String, dynamic> showJson) {
      return Show(
        name: showJson['name'],
        image: showJson['image'] ?? placeholderImg,
        id: showJson['id'],
        genres: showJson["genres"] != null ? (showJson["genres"] as List).map((e) => e as String).toList() : null,
        rating: showJson['rating'] ?? 'N/A',
        year: showJson['year'] ?? "N/A",
        summary: formatString( showJson['summary'] ?? "No summary available" ),
        fullImage: showJson['image'] ?? placeholderImg,
        status: showJson['status'],
      );
    }
    static Map<String, dynamic> toMap(Show show) => {
      'name': show.name,
      'image': show.image,
      'id': show.id,
      'genres': show.genres,
      'rating': show.rating,
      'averageRuntime': show.year,
      'summary': show.summary,
      'fullImage': show.fullImage,
      'status': show.status,
    };

    static String getYear(String? date) {
      return date?.substring(0, 4) ?? 'N/A';
    }

    static List<String> encode(List<Show> shows) =>
      shows.map((show) => json.encode(Show.toMap(show))).toList();

    static List<Show> decodePreferences(List<String> shows) =>
        shows.map((show) => Show.fromPreferences(json.decode(show))).toList();

    static List<Show> decode(String shows) =>
        (json.decode(shows) as List<dynamic>)
            .map<Show>((item) => Show.fromPreferences(item))
            .toList();

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