import 'package:flutter/material.dart';
import 'package:progetto_esame/models/show.dart';
import 'package:progetto_esame/views/widgets/show_card.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key,
  }) : super(key : key);

  static List<Show> favorite_shows = [];

  static void addFavShow(Show show){
    if(favorite_shows.contains(show)){
      favorite_shows.remove(show);
    }else{
      favorite_shows.add(show);
    }

  }

  @override
  State<FavoritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavoritesPage>{
  List fav_shows = FavoritesPage.favorite_shows;
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