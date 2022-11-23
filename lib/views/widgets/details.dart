import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:math';

class DetailsPage extends StatelessWidget {
  final String title;
  final String summary;
  final String fullImage;
  final List<String> genres;
  const DetailsPage({
    Key? key,
    required this.title,
    required this.summary,
    required this.fullImage,
    required this.genres,
  }) : super(key: key);

  final Color textBlack = const Color(0xff3a3a3a);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.favorite_outline,
              color: Colors.white,
            ),
            onPressed: () {
            },
          )
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
                                image: CachedNetworkImageProvider(fullImage),
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter, //const Alignment(0.40, 0.0),
                                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.40), BlendMode.multiply),
                              )
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: const Alignment(0.0, 0.50),
                                colors: [ Colors.transparent, Theme.of(context).backgroundColor, ],
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
                                width: MediaQuery.of(context).size.width * 0.24,
                                child: FilmImage(thumbnailUrl: fullImage, ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric( vertical: 8, horizontal: 0, ),
                                child: Text(
                                  title,
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
                  Container(
                    color: Theme.of(context).backgroundColor,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(18, 6, 18, 9),
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
                          margin: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                          child: Text(
                            genres.join(", "),
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
                ],
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
                      margin: const EdgeInsets.fromLTRB(18, 0, 18, 20),
                      child: Text(
                        summary,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          height: 1.2,
                          fontSize: 14,
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
                height: MediaQuery.of(context).size.height,
              ),
            ),
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