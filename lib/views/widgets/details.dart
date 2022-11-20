import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              expandedHeight: 280.0,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                titlePadding: EdgeInsets.fromLTRB(20, 0, 0, 10),
                background: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.70), BlendMode.multiply),
                      image: CachedNetworkImageProvider(fullImage),
                      fit: BoxFit.cover,
                      alignment: Alignment.topLeft,
                    ),
                  ),
                ),
                title: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                      ),

                    ),
                  ),
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
                      margin: const EdgeInsets.fromLTRB( 18, 20, 18, 9 ),
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
                      margin: const EdgeInsets.fromLTRB( 18, 0, 18, 0 ),
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
                      margin: const EdgeInsets.fromLTRB(18,0,18,20),
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
                color: Colors.purple,
              ),
            ),
          ],
        ),
    );
  }
}