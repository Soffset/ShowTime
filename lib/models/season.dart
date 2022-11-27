import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:progetto_esame/models/show.dart';

class Season {
  final int id;
  final int number;
  final int episodesNumber;
  final String image;
  Season({
    required this.id,
    required this.number,
    required this.episodesNumber,
    required this.image,
  });

  factory Season.fromJson(dynamic json) {
    return Season(
      id: json['id'],
      number: json['number'],
      episodesNumber: json['episodeOrder'],
      image: json['image']['medium'],
    );
  }

  static List<Season> showsFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Season.fromJson(data);
    }).toList();
  }
}

class SeasonsApi {
  
  static Future<List<Season>> getSeason(int id) async {
    var uri = Uri.https('api.tvmaze.com','/shows/$id/seasons');//season id

    final response = await http.get(uri);

    List data = await jsonDecode(response.body);

    List _temp = [];

    for (var i in data) {
      _temp.add(i);//add each object in the json to a list
    }

    return Season.showsFromSnapshot(_temp);
  }


}

