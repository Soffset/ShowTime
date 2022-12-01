import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:progetto_esame/models/show.dart';

class ShowApi {
  static Future<List<Show>> getShows() async {
    var uri = Uri.https('api.tvmaze.com','/shows');

    final response = await http.get(uri);

    List data = await jsonDecode(response.body);

    List _temp = [];

    for (var i in data) {
      _temp.add(i);//add each object in the json to a list
    }

    return Show.showsFromSnapshot(_temp);
  }

  static Future<List<Show>> getShow(String name) async {
    var params = { "q" : name };
    var uri = Uri.https('api.tvmaze.com','/search/shows', params);
    //https://api.tvmaze.com/search/shows?q=girls
    final response = await http.get(uri);

    List data = await jsonDecode(response.body);

    List _temp = [];

    for (var i in data) {
      _temp.add(i["show"]);//add each object in the json to a list
    }

    return Show.showsFromSnapshot(_temp);
  }

  static String ratingToString(dynamic value) {
    if(value == null){
      return "N/A";
    } else {
      return value.toString();
    }
  }


}

