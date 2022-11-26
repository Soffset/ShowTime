import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:progetto_esame/models/show.dart';

class EpisodesApi {
  final Show show;
  EpisodesApi({
    required this.show,
  });
  static Future<List<Episode>> getEpisode(int id) async {
    var uri = Uri.https('api.tvmaze.com','/shows/$id');

    final response = await http.get(uri);

    List data = await jsonDecode(response.body);

    List _temp = [];

    for (var i in data) {
      _temp.add(i);//add each object in the json to a list
    }

    return Episode.showsFromSnapshot(_temp);
  }


}

class Episode {
  final int id;
  final String name;
  final int number;
  final String summary;
  final String image;
  Episode({
    required this.id,
    required this.name,
    required this.number,
    required this.summary,
    required this.image,
  });

  factory Episode.fromJson(dynamic json) {
    return Episode(
      id: json['id'],
      name: json['name'],
      number: json['number'],
      summary: json['summary'],
      image: json['image']['medium'],
    );
  }

  static List<Episode> showsFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Episode.fromJson(data);
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
