import 'package:flutter/material.dart';
import 'package:progetto_esame/models/episodes.api.dart';
import 'package:progetto_esame/models/season.dart';
import 'package:progetto_esame/models/show.dart';
import 'package:progetto_esame/models/episode.dart';
import 'package:progetto_esame/views/widgets/episode_card.dart';
class EpisodeList extends StatefulWidget {
  final Show show;
  const EpisodeList({
    super.key,
    required this.show,
  });

  @override
  State<EpisodeList> createState() => _EpisodeListState();
}

class _EpisodeListState extends State<EpisodeList> {
  String dropdownValue = "";

  bool _seasonsLoading = true;
  List<Season> _seasons = [];
  bool _episodesLoading = true;
  List<Episode> _episodes = [];
  bool _disposing = false;

  @override
  void initState() {
    getSeasons();
    super.initState();
  }

  Future<void> getSeasons() async {
    _seasons = await SeasonsApi.getSeason(widget.show.id);
    if(_seasons.isEmpty){
      return;
    }
    _seasonsLoading = false;
    dropdownValue = _seasons[0].id.toString();
    getEpisodes().then(
      (episodes) => {
        if(!_disposing){
          setState(() {
            _episodes = episodes;
            _episodesLoading = false;
          })
        }
      });
  }

  Future<List<Episode>> getEpisodes() async {
    _episodes = await EpisodesApi.getEpisode(int.parse(dropdownValue));
    return _episodes;
  }

  dispose() {
    _disposing = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _seasons.isEmpty ? Container()
      : Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _seasonsLoading
            ? DropdownButton<String>(
          disabledHint: const Text("Loading"),
          onChanged: null,
          items: const [],
        )
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
              getEpisodes();

            });
          },
          items: _seasons.map<DropdownMenuItem<String>>((season) {
            return DropdownMenuItem<String>(
              value: season.id.toString(),
              child: Text("Season ${season.number}"),
            );
          }).toList(),
        ),
        ClipRRect(
          //width: MediaQuery.of(context).size.width,
          borderRadius: BorderRadius.circular(5.0),
          child: _episodesLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: _episodes.length,
            itemBuilder: (context, index) {
              return EpisodeCard(
                episode: _episodes[index],
              );
            },
          ),
        ),
      ],
    );
  }
}