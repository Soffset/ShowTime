import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:progetto_esame/models/show.dart';

class ShowApi {
  static Future<List<Show>> getShow() async {
    var uri = Uri.https('api.tvmaze.com','/shows');

    final response = await http.get(uri);

    List data = jsonDecode(response.body);

    List _temp = [];

    for (var i in data) {
      List<String> genres;

      var s = TmpShow(
          i['name'],
          i['image']['medium'],
          i['id'], genres,
          i['rating']['average'],
          i['runtime'] );
      _temp.add(s);
      print(s);
    }

    return Show.showsFromSnapshot(_temp);
  }
}

class TmpShow {
  String name;
  String image;
  int id;
  List<String> genres;
  int rating;
  int duration;
  TmpShow(this.name, this.image, this.id, this.genres, rating, this.duration){
    this.rating as int;
  }
}