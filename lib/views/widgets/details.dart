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
        //backgroundColor: Colors.red,
        //toolbarHeight: 0,
        //shadowColor: Colors.transparent,// Status bar color
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.favorite_outline,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            /*SliverPersistentHeader(
              pinned: true,
              delegate: DetailsAppBar(bgImage: fullImage, title: title),
            ),*/
            SliverToBoxAdapter(
              child: Container(
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
                color: Colors.purple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsAppBar extends SliverPersistentHeaderDelegate {
  final double _maxExtent = 270;
  final String bgImage;
  final String title;
  var rng = Random();
  DetailsAppBar({
    required this.bgImage,
    required this.title,
  });
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Material(
          //color: Theme.of(context).focusColor,
          child: Stack(
            children: [
              shrinkOffset < (_maxExtent - kToolbarHeight)
                  ? Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.6), BlendMode.multiply),
                      image: NetworkImage(bgImage),
                      fit: BoxFit.cover,
                    ),
                  ))
                  : Container(),
              Align(
                alignment: Alignment(
                    -1, shrinkOffset > (_maxExtent - kToolbarHeight) ? 0 : -1),
                child: Material(
                  color: Colors.transparent,
                  child: IconButton(
                    color: Theme.of(context).textTheme.bodyText1!.color,
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment(
                    0, shrinkOffset > (_maxExtent - kToolbarHeight) ? 0 : 0.8),
                child: Text(
                  title,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1!.color,
                    fontWeight: FontWeight.w400,
                    height: 1.2,
                    fontSize: 21,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),

              // here provide actions
              Align(
                alignment: Alignment( 1, shrinkOffset > (_maxExtent - kToolbarHeight) ? 0 : -1 ),
                child: Material(
                  color: Colors.transparent,
                  child: IconButton(
                    color: Theme.of(context).textTheme.bodyText1!.color,
                    icon: const Icon(Icons.star_border),
                    onPressed: () {
                      debugPrint('fav pressed');
                    },
                  ),
                ),
              ),
            ],
          ),
        );

  }

  @override
  double get maxExtent => _maxExtent;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(covariant DetailsAppBar oldDelegate) {
    return oldDelegate != this;
  }
}
