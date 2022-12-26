import 'package:flutter/material.dart';
import 'package:ShowTime/models/episodes.api.dart';
import 'package:ShowTime/models/season.dart';
import 'package:ShowTime/models/show.dart';
import 'package:ShowTime/models/episode.dart';
import 'package:ShowTime/views/widgets/episode_card.dart';
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
        updateEpisodes(),
      });
  }

  Future<void> updateEpisodes() async {
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
          elevation: 16,
          onChanged: (String? value) {
            setState(() {
              dropdownValue = value!;
              updateEpisodes();

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