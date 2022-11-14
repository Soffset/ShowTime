import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:progetto_esame/models/show.dart';

class ShowApi {
  static Future<List<Show>> getShow() async {
    var uri = Uri.https('api.tvmaze.com','/shows');

    final response = await http.get(uri);

    List data = await jsonDecode(response.body);

    List temp = [];

    for (var i in data) {
      List<String> genres = [];
      var s = TmpShow(
        i['name'],
        i['image']['medium'],
        i['id'],
        genres,
        ratingToString(i['rating']['average']),
        i['averageRuntime'],
        formatString(i['summary']),
        i['image']['original'],);
      temp.add(s);
    }

    return Show.showsFromSnapshot(temp);
  }

  static String ratingToString(dynamic value) {
    if(value == null){
      return "N/A";
    } else {
      return value.toString();
    }
  }

  static String formatString(String str){
    String formatted = str;
    formatted = formatted.replaceAll ("<p>", "").replaceAll ("</p>", "");
    formatted = formatted.replaceAll ("<b>", "").replaceAll ("</b>", "");
    formatted = formatted.replaceAll ("<i>", "").replaceAll ("</i>", "");
    return formatted;
  }
}

class TmpShow {
  String name;
  String image;
  int id;
  List<String> genres;
  String rating;
  int duration;
  String summary;
  String fullImage;
  TmpShow(this.name, this.image, this.id, this.genres, this.rating, this.duration, this.summary, this.fullImage);
}

