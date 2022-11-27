import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:progetto_esame/models/episodes.api.dart';
import 'package:progetto_esame/models/season.dart';
import 'package:progetto_esame/models/show.dart';
import 'package:progetto_esame/models/episode.dart';
import 'package:progetto_esame/views/widgets/episode_card.dart';

class DetailsPage extends StatefulWidget {
  final Show show;
  const DetailsPage({Key? key,
    required this.show,
  }) : super(key: key);

  @override
  DetailsPageState createState() => DetailsPageState();
}

class DetailsPageState extends State<DetailsPage> {
  bool _isLoading = true;
  List<Episode> _episodes = [];

  @override
  void initState() {
    super.initState();
    //getEpisodes();
  }

  Future<void> getEpisodes() async {
    _episodes = await EpisodesApi.getEpisode(widget.show.id);
    var l = _episodes.length;
    print('Episodes: $l');
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        leading: BackButton(
          color: Theme.of(context).appBarTheme.actionsIconTheme?.color,
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon( Icons.favorite_outline,),
            onPressed: () { },
            color: Theme.of(context).appBarTheme.actionsIconTheme?.color,
          ),
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.31,
                    child: Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.29,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: CachedNetworkImageProvider(widget.show.fullImage),
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter, //const Alignment(0.40, 0.0),
                                colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.background.withOpacity(0.40), BlendMode.multiply),
                              )
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: const Alignment(0.0, 0.50),
                                colors: [ Colors.transparent, Theme.of(context).colorScheme.background, ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.18,
                                width: MediaQuery.of(context).size.height * 0.12,
                                child: FilmImage( thumbnailUrl: widget.show.fullImage, ),
                              ),
                              Container(
                                padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
                                child: Text(
                                  widget.show.name,
                                  style: const TextStyle(
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                ],
              ),

            ),
            SliverToBoxAdapter(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(18, 0, 18, 9),
                      child: Text(
                        'Status • ${widget.show.status}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          height: 1.2,
                          fontSize: 17,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(18, 0, 18, 9),
                      child: const Text(
                        'Genres',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          height: 1.2,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 0, 18, 0),
                      child: Text(
                        widget.show.genres.join(", "),
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          height: 1.2,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(18, 15, 18, 9),
                      child: const Text(
                        'Summary',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          height: 1.2,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 0, 18, 20),
                      child: Text(
                        widget.show.summary,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          height: 1.2,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.fromLTRB(18, 0, 18, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: DropdownButtonExample(showId: widget.show.id,),
                    ),
                    Expanded( flex: 3, child: Container( color: Colors.red)),
                  ],
                ),
              ),
            ),
            /*SliverToBoxAdapter(
                  child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  :  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _episodes.length,
                    itemBuilder: (context, index) {
                      return EpisodeCard( episode: _episodes[index], );
                    },
                  ),
            ),*/
          ],
        ),
      ),
    );
  }
}

class FilmImage extends StatelessWidget {
  final String thumbnailUrl;

  const FilmImage({Key? key,
    required this.thumbnailUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image(
              image: CachedNetworkImageProvider(thumbnailUrl),
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: const Color(0x20EEEEEE),
              highlightColor: const Color(0x35EEEEEE),
              borderRadius: BorderRadius.circular(6),
              onTap: () { },
            ),
          ),
        ],
      ),
    );

    throw UnimplementedError();
  }

}

class DropdownButtonExample extends StatefulWidget {
  final int showId;
  const DropdownButtonExample({super.key,
    required this.showId,
  });

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = "";

  bool _isLoading = true;
  List<Season> _seasons = [];

  @override
  void initState() {
    super.initState();
    getSeasons();
  }

  Future<void> getSeasons() async {
    _seasons = await SeasonsApi.getSeason(widget.showId);
    dropdownValue = _seasons[0].id.toString();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading || _seasons.isEmpty
      ? DropdownButton<String> ( disabledHint: const Text("Loading"), onChanged: null, items: const [],)
      : DropdownButton<String>(
      value: dropdownValue,
      //icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      //style: const TextStyle(color: Colors.deepPurple),
      /*underline: Container(
        height: 2,
        color: Colors.white,
      ),*/
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
          print('Dropdown value: ${dropdownValue}');
        });
      },
      items: _seasons.map<DropdownMenuItem<String>>((season) {
        return DropdownMenuItem<String>(
          value: season.id.toString(),
          child: Text("Season ${season.number}"),
        );
      }).toList(),
    );
  }
}