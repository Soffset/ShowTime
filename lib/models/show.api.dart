import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:progetto_esame/models/show.dart';
import 'dart:developer' as developer;

class ShowApi {
  static Future<List<Show>> getShow() async {
    var uri = Uri.https('api.tvmaze.com','/shows');

    final response = await http.get(uri);

    List data = await jsonDecode(response.body);

    List _temp = [];

    for (var i in data) {
      List<String> genres = [];
      var s = TmpShow(
          i['name'],
          i['image']['original'],
          i['id'],
          genres,
          checkDouble(i['rating']['average']),
          i['averageRuntime'] );
      _temp.add(s);
    }

    return Show.showsFromSnapshot(await _temp);
  }

  static num checkDouble(dynamic value) {
    if (value is String) {
      return num.parse(value);
    } else if(value == null){
      return -1;
    } else {
      return value;
    }



  }
}

class TmpShow {
  String name;
  String image;
  int id;
  List<String> genres;
  num rating;
  int duration;
  TmpShow(this.name, this.image, this.id, this.genres, this.rating, this.duration);
}

