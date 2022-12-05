import 'package:flutter/material.dart';
import 'package:progetto_esame/models/show.dart';
import 'package:progetto_esame/views/widgets/show_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key,
  }) : super(key : key);

  static List<Show> favorite_shows = [];

  static void getFavorites() async { //updates favorite_shows fetching from shared preferences
    const key = 'fav_shows';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> showsFromPreference = prefs.getStringList(key) ?? [];
    favorite_shows.clear();
    List<Show> preferencesShows = Show.decodePreferences(showsFromPreference);
    favorite_shows = [...preferencesShows];
  }


  static void changeFavShow(Show show) async { //adds/removes a show to favorite_shows and saves it to shared preferences
    final prefs = await SharedPreferences.getInstance();
    const key = 'fav_shows';

    if(favorite_shows.contains(show)){
      favorite_shows.remove(show);
    }else{
      favorite_shows.add(show);
    }

    prefs.setStringList(key, Show.encode(favorite_shows));
  }

  static bool isFavorite(Show show) { //checks if a show is in favorite_shows
    bool isFav = false;
if(favorite_shows.contains(show)){
      isFav = true;
    }
    return isFav;
  }

  @override
  State<FavoritesPage> createState() => _FavouritesPageState();
}


class _FavouritesPageState extends State<FavoritesPage>{
  List fav_shows = FavoritesPage.favorite_shows;

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      fav_shows = FavoritesPage.favorite_shows;
    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: BackButton(
          color: Theme.of(context).appBarTheme.actionsIconTheme?.color,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: const [
            //Icon(Icons.favorite_rounded),
            SizedBox(width: 10),
            Text('Favorite shows'),
          ],
        ),
      ),
      body: fav_shows.isEmpty
      ? const Center(child: Text("No favorite shows added yet!", style: TextStyle(fontSize: 20),))
          : ListView.builder(
      itemCount: fav_shows.length,
      itemBuilder: (context, index) {
      return ShowCard( show: fav_shows[index], );
      },
    )
    );
    throw UnimplementedError();
  }

}