import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:progetto_esame/models/show.dart';


class DetailsPage extends StatelessWidget {
  final Show show;
  const DetailsPage({
    Key? key,
    required this.show,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        leading: BackButton(
          color: Theme.of(context).appBarTheme.actionsIconTheme?.color,
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon( Icons.favorite_outline,),
            onPressed: () { },
            color: Theme.of(context).appBarTheme.actionsIconTheme?.color,
          ),
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
                                image: CachedNetworkImageProvider(show.fullImage),
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter, //const Alignment(0.40, 0.0),
                                colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.background.withOpacity(0.40), BlendMode.multiply),
                              )
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: const Alignment(0.0, 0.50),
                                colors: [ Colors.transparent, Theme.of(context).colorScheme.background, ],
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
                                width: MediaQuery.of(context).size.height * 0.12,
                                child: FilmImage( thumbnailUrl: show.fullImage, ),
                              ),
                              Container(
                                padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
                                child: Text(
                                  show.name,
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

                ],
              ),

            ),
            SliverToBoxAdapter(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(18, 0, 18, 9),
                      child: Text(
                        'Status • ${show.status}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          height: 1.2,
                          fontSize: 17,
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
                      margin: const EdgeInsets.fromLTRB(18, 0, 18, 9),
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
                      margin: const EdgeInsets.fromLTRB(20, 0, 18, 0),
                      child: Text(
                        show.genres.join(", "),
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
                      margin: const EdgeInsets.fromLTRB(20, 0, 18, 20),
                      child: Text(
                        show.summary,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          height: 1.2,
                          fontSize: 15,
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