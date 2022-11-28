import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:progetto_esame/models/show.dart';
import 'package:progetto_esame/models/episode.dart';

class EpisodesApi {
  final Show show;
  EpisodesApi({
    required this.show,
  });
  static Future<List<Episode>> getEpisode(int id) async {
    var uri = Uri.https('api.tvmaze.com','/seasons/$id/episodes');//season id

    final response = await http.get(uri);

    List data = await jsonDecode(response.body);

    List _temp = [];

    for (var i in data) {
      if(i['number'] != null) {
        _temp.add(i);//add each object in the json to a list
      }
    }

    return Episode.showsFromSnapshot(_temp);
  }


}

