import 'package:flutter/material.dart';
import 'package:progetto_esame/models/show.dart';
import 'package:progetto_esame/views/widgets/show_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key,
  }) : super(key : key);

  //static List<Show> favorite_shows = [];
  static ValueNotifier<List<Show>> favorite_shows_notifier = ValueNotifier([]);

  static void getFavorites() async { //updates favorite_shows fetching from shared preferences
    const key = 'fav_shows';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> showsFromPreference = prefs.getStringList(key) ?? [];
    favorite_shows_notifier.value.clear();
    List<Show> preferencesShows = Show.decodePreferences(showsFromPreference);
    favorite_shows_notifier.value = [...preferencesShows];
  }


  static void changeFavShow(Show show) async { //adds/removes a show to favorite_shows and saves it to shared preferences
    final prefs = await SharedPreferences.getInstance();
    const key = 'fav_shows';

    if(favorite_shows_notifier.value.contains(show)){
      var fav_old = [...favorite_shows_notifier.value];
      fav_old.remove(show);
      favorite_shows_notifier.value = [...fav_old];

    }else{
      favorite_shows_notifier.value = [...favorite_shows_notifier.value, show];
    }

    prefs.setStringList(key, Show.encode(favorite_shows_notifier.value));
  }

  static bool isFavorite(Show show) { //checks if a show is in favorite_shows
    bool isFav = false;
if(favorite_shows_notifier.value.contains(show)){
      isFav = true;
    }
    return isFav;
  }

  @override
  State<FavoritesPage> createState() => _FavouritesPageState();
}


class _FavouritesPageState extends State<FavoritesPage>{

  @override
  void initState() {
    // TODO: implement initState
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
      body: AnimatedBuilder(
          animation: FavoritesPage.favorite_shows_notifier,
          builder: (context, child) {
            return FavoritesPage.favorite_shows_notifier.value.isEmpty
              ? const Center(child: Text("No favorite shows added yet!", style: TextStyle(fontSize: 20),))
              : ListView.builder(
              itemCount: FavoritesPage.favorite_shows_notifier.value.length,
              itemBuilder: (context, index) {
                return ShowCard(show: FavoritesPage.favorite_shows_notifier.value[index],);
              },
            );
          }
      ),


    );
    throw UnimplementedError();
  }

}