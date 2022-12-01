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
  bool searching = false;
  String searchText = '';


  @override
  void initState() {
    super.initState();
    getShows();
  }

  Future<void> getShows() async {
    _shows = await ShowApi.getShows();
    setState(() {
      _isLoading = false;
    });

  }

  Future<void> textChanged(String text) async{
    if(text == '') {
      return;
    }

    await Future.delayed(const Duration(milliseconds: 600));
    if(text != searchText || text == '')
      return;

    setState(() {
      _isLoading = true;
    });

    _shows.clear();
    _shows = await ShowApi.getShow(text);
    setState(() {
      _isLoading = false;
    });
    print(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: searching
        ? AppBar(
          centerTitle: true,
          leading: const Icon(Icons.search,),
          title: SizedBox(
            height: kToolbarHeight,
            child: Row(
              children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 3),
                      child: TextField(
                        autofocus: true,
                        textAlignVertical: TextAlignVertical.bottom,
                        style: const TextStyle(
                          color: Colors.black87,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Theme.of(context).appBarTheme.actionsIconTheme?.color,
                          border: const OutlineInputBorder(),
                          hintText: 'Search',
                          hintStyle: const TextStyle(
                            color: Colors.black45,
                          ),
                        ),
                        onChanged: (text) => {
                          setState((){ searchText = text; }),
                          textChanged(text)
                      },
                      ),
                    ),
                  ),
              ],
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.close,
              ),
              onPressed: () { setState(() {
                searching = false;
              }); },
              color: Theme.of(context).appBarTheme.actionsIconTheme?.color,
            ),
          ],
        )
        : AppBar(
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.movie_rounded),
              SizedBox(width: 10),
              Text('Show Time'),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.search,
              ),
              onPressed: () { setState(() {
                searching = true;
              }); },
              color: Theme.of(context).appBarTheme.actionsIconTheme?.color,
            ),
          ],
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