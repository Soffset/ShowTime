import 'package:flutter/material.dart';
import 'package:progetto_esame/models/show.api.dart';
import 'package:progetto_esame/models/show.dart';
import 'package:progetto_esame/views/widgets/show_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Show> _shows = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getShows();
  }

  Future<void> getShows() async {
    _shows = await ShowApi.getShow();
    setState(() {
      _isLoading = false;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.movie_rounded),
              SizedBox(width: 10),
              Text('Shows')
            ],
          ),
        ),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: _shows.length,
          itemBuilder: (context, index) {
            return ShowCard(
                title: _shows[index].name,
                duration: _shows[index].duration.toString(),
                rating: _shows[index].rating.toString(),
                thumbnailUrl: _shows[index].image,
                summary: _shows[index].summary.toString());
          },
        ));
  }
}