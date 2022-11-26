import 'package:flutter/material.dart';
import 'package:progetto_esame/models/show.api.dart';
import 'package:progetto_esame/models/show.dart';
import 'package:progetto_esame/views/widgets/show_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
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
              Text('Shows'),
            ],
          ),
        ),
        body: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
              itemCount: _shows.length,
              itemBuilder: (context, index) {
              return ShowCard( show: _shows[index],);
            },
          ),

    );
  }
}