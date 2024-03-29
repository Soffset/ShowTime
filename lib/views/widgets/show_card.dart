import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ShowTime/views/widgets/details.dart';
import 'package:ShowTime/views/widgets/card_thumbnail.dart';
import 'package:ShowTime/models/show.dart';


class ShowCard extends StatelessWidget {
  final Show show;
  const ShowCard({Key? key,
    required this.show,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    CachedNetworkImage.logLevel = CacheManagerLogLevel.debug;
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: GestureDetector(
          onTapUp: (tud){ Navigator.of(context).push(openDetailsRoute(show)); },
          onTapCancel: (){},
          //onTap: (){ openDetails(context); },
          child: Container(
            width: double.infinity,
            height: (MediaQuery.of(context).size.width * 0.32015) * 1.58,
            margin: const EdgeInsets.symmetric(horizontal: 9, vertical: 4.5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  offset: const Offset(
                    0.0,
                    0.0,
                  ),
                  blurRadius: 1.5,
                  spreadRadius: 0.1,
                ),
              ],
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              margin: const EdgeInsets.all(0),
              elevation: 1,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
                    width: MediaQuery.of(context).size.width * 0.32015,
                    height: double.infinity,
                    child: CardThumbnail( show: show, ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children:[
                        Align(
                          alignment: Alignment.center,
                          child: Container (
                            margin: const EdgeInsets.fromLTRB(2, 8, 0, 5),
                            width: double.infinity,
                            child: Text(
                              show.name,
                              style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 21,
                                  )
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              textAlign: TextAlign.left,
                            ),
                          ),

                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container (
                            margin: const EdgeInsets.fromLTRB(3, 2, 10, 7),
                            width: double.infinity,
                            child: Text(
                              show.summary ?? "No summary.",
                              style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.5,
                                  )
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                              textAlign: TextAlign.left,
                            ),
                          ),

                        ),
                        const Spacer(),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(1, 0, 7, 0),
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
                                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 7),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                      const SizedBox(width: 7),
                                      Text(
                                        show.rating ?? "0",
                                        style: const TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
                                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 7),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(
                                          Icons.calendar_today,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                      const SizedBox(width: 7),
                                      Text(
                                        show?.year ?? "N/A",
                                        style: const TextStyle(color: Colors.white),
                                      ),

                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),

                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),


    );
  }
  static Route openDetailsRoute(Show show) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => DetailsPage(show: show,),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          final tween = Tween(begin: begin, end: end);
          final offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
    );
  }



}