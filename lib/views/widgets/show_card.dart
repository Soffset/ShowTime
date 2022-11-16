import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:progetto_esame/views/widgets/details.dart';

class ShowCard extends StatelessWidget {
  final String title;
  final String rating;
  final String duration;
  final String thumbnailUrl;
  final String summary;
  final String fullImage;
  const ShowCard({Key? key,
    required this.title,
    required this.duration,
    required this.rating,
    required this.thumbnailUrl,
    required this.summary,
    required this.fullImage,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    CachedNetworkImage.logLevel = CacheManagerLogLevel.debug;
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Container(
          //margin: const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
          width: double.infinity,
          height: (MediaQuery.of(context).size.width * 0.32015) * 1.58,
          margin: const EdgeInsets.symmetric(horizontal: 9, vertical: 4.5),
          decoration: BoxDecoration(
            //color: Color(0xff525151),
            //color: Color(0xff3d3d3d),
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                offset: const Offset(
                  0.0,
                  4.0,
                ),
                blurRadius: 7.0,
                spreadRadius: -8.0,
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
                  //color: Colors.blue,
                  margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
                  width: MediaQuery.of(context).size.width * 0.32015,
                  height: double.infinity,
                  child: Material(
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
                                MaterialPageRoute(builder: (context) => DetailsPage(title: title, summary: summary, fullImage: fullImage,)),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children:[
                      Align(
                        alignment: Alignment.center,
                        child: Container (
                          //color: Colors.red,//debug
                          margin: const EdgeInsets.fromLTRB(2, 8, 0, 5),
                          width: double.infinity,
                          child: Text(
                            title,
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
                          //color: Colors.amberAccent,
                          margin: const EdgeInsets.fromLTRB(3, 2, 10, 7),
                          width: double.infinity,
                          //color: Colors.red,
                          child: Text(
                            summary,
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
                          //color: Colors.greenAccent,
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
                                      color: Colors.yellow,
                                      size: 18,
                                    ),
                                    const SizedBox(width: 7),
                                    Text(
                                        rating,
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
                                      Icons.schedule,
                                      color: Colors.blue,
                                      size: 18,
                                    ),
                                    const SizedBox(width: 7),
                                    Text(
                                      duration,
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
                )

              ],
            ),
          ),
        ),
    );
  }
}