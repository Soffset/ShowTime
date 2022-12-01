import 'package:flutter/material.dart';
import 'package:progetto_esame/models/show.dart';

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
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
      body: Container(
        child: Text( FavoritesPage.favorite_shows.length.toString() ),
      ),
    );
    throw UnimplementedError();
  }

}