import 'dart:convert';
import 'package:http/http.dart' as http;

class Season {
  final int id;
  final int number;
  final int episodesNumber;
  Season({
    required this.id,
    required this.number,
    required this.episodesNumber,
  });

  factory Season.fromJson(dynamic json) {
    return Season(
      id: json['id'],
      number: json['number'],
      episodesNumber: json['episodeOrder'],
    );
  }

  static List<Season> showsFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Season.fromJson(data);
    }).toList();
  }

  static String getImage( imageLink ){
    if(imageLink == null ){
      return "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png";
    }else{
      return imageLink["medium"];
    }

  }
}

class SeasonsApi {
  
  static Future<List<Season>> getSeason(int id) async {
    var uri = Uri.https('api.tvmaze.com','/shows/$id/seasons');//season id

    final response = await http.get(uri);

    List data = await jsonDecode(response.body);

    List _temp = [];

    for (var i in data) {
      if(i["episodeOrder"] != null) {
        _temp.add(i); //add each object in the json to a list
      }
    }

    return Season.showsFromSnapshot(_temp);
  }


}

