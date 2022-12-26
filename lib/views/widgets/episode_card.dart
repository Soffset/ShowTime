import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ShowTime/models/episode.dart';

class EpisodeCard extends StatelessWidget{
  final Episode episode;
  const EpisodeCard({Key? key,
    required this.episode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Theme.of(context).cardTheme.color,
      width: MediaQuery.of(context).size.width,
      height: 75,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 6.0),
              height: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image(
                  image: NetworkImage( episode.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text( "${episode.number}. ${episode.name}",
            style: const TextStyle(
              fontSize: 16,
            ),
            ),
          ),
        ],
      )
    );
    throw UnimplementedError();
  }


}