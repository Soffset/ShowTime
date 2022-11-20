import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:progetto_esame/views/widgets/details.dart';
import 'package:progetto_esame/views/widgets/show_card.dart';

class CardThumbnail extends StatelessWidget {
  final String thumbnailUrl;
  final ShowCard parentCard;

  const CardThumbnail({Key? key,
    required this.thumbnailUrl,
    required this.parentCard,
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailsPage(title: parentCard.title, summary: parentCard.summary, fullImage: parentCard.fullImage, genres: parentCard.genres,)),
                );
              },
            ),
          ),
        ],
      ),
    );

    throw UnimplementedError();
  }

}