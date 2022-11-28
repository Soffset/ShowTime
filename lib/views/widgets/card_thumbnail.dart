import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:progetto_esame/views/widgets/show_card.dart';
import 'package:progetto_esame/models/show.dart';

class CardThumbnail extends StatelessWidget {
  final Show show;

  const CardThumbnail({Key? key,
    required this.show,
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
              image: CachedNetworkImageProvider(show.image),
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
              onTap: (){ Navigator.of(context).push(ShowCard.openDetailsRoute(show)); },
            ),
          ),
        ],
      ),
    );

    throw UnimplementedError();
  }

}