import 'package:flutter/material.dart';
import 'package:progetto_esame/models/episode.dart';

class EpisodeCard extends StatelessWidget{
  final Episode episode;
  const EpisodeCard({Key? key,
    required this.episode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 30,
      child: Text( episode.name ),
    );
    throw UnimplementedError();
  }


}