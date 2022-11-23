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
              child: Material(
                color: Colors.transparent,
                child: Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.38,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(fullImage),
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                            //colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.30), BlendMode.multiply),
                          )
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.38,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Theme.of(context).backgroundColor, ]
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Theme.of(context).backgroundColor,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(18, 20, 18, 9),
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
                color: Theme.of(context).appBarTheme.backgroundColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
